-- Panini WC2026 tracker sync setup for Supabase.
-- Run this in Supabase SQL Editor once per project.
--
-- The app calls only the RPC functions below with the public anon key and a
-- family sync code. The table itself is not exposed to anon/authenticated roles.

create extension if not exists pgcrypto;

create table if not exists public.panini_collections (
  sync_code_hash text primary key,
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.panini_collections enable row level security;

revoke all on table public.panini_collections from anon;
revoke all on table public.panini_collections from authenticated;

create or replace function public.panini_sync_hash(p_sync_code text)
returns text
language sql
immutable
as $$
  select encode(digest(trim(coalesce(p_sync_code, '')), 'sha256'), 'hex')
$$;

create or replace function public.panini_pull_collection(p_sync_code text)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  result jsonb;
begin
  if length(trim(coalesce(p_sync_code, ''))) < 8 then
    raise exception 'Sync code must be at least 8 characters';
  end if;

  select payload
    into result
    from public.panini_collections
   where sync_code_hash = public.panini_sync_hash(p_sync_code);

  return result;
end;
$$;

create or replace function public.panini_push_collection(p_sync_code text, p_payload jsonb)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  saved jsonb;
begin
  if length(trim(coalesce(p_sync_code, ''))) < 8 then
    raise exception 'Sync code must be at least 8 characters';
  end if;

  if p_payload is null or jsonb_typeof(p_payload) <> 'object' then
    raise exception 'Payload must be a JSON object';
  end if;

  insert into public.panini_collections (sync_code_hash, payload, updated_at)
  values (public.panini_sync_hash(p_sync_code), p_payload, now())
  on conflict (sync_code_hash)
  do update set payload = excluded.payload, updated_at = now()
  returning payload into saved;

  return saved;
end;
$$;

grant execute on function public.panini_pull_collection(text) to anon;
grant execute on function public.panini_push_collection(text, jsonb) to anon;
