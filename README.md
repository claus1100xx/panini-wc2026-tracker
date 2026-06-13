# Panini World Cup 2026 Tracker

A static GitHub Pages web app for tracking the 2026 World Cup Panini sticker collection across four collectors: Claus, Holger, Karl-Eric, and Sam.

## Features

- Multi-collector tracking
- Album page, grid, missing list, and trade center views
- Local browser progress saving with optional Supabase background sync
- Duplicate and trade matching
- Excel export with offline-compatible fallback
- JSON backup and restore
- Mobile-friendly layout with bottom navigation

Sticker metadata is sourced from Checklist Insider and stored locally in `checklist-insider-data.js`.

## Cloud Sync

The app is local-first. For seamless sync across phones, tablets, and computers without logins or per-device tokens, use a Supabase family room link:

1. Create a free Supabase project.
2. Open Supabase SQL Editor and run `supabase-schema.sql`.
3. Add the Supabase Project URL and public anon key to `SUPABASE_PROJECT` in `index.html`, or enter them once in **Cloud Sync** > **Advanced setup**.
4. On the main device, open **Cloud Sync** and click **Create Family Sync Link**.
5. Share the generated link with the other devices. Opening that link joins the same family room automatically.
6. Leave **Auto sync** enabled to push future changes in the background.

The Supabase anon key is public by design. The private part is the generated room code in the shared `#room=` link, so only share it with your collectors.

GitHub Gist sync remains available as an advanced fallback from the same **Cloud Sync** dialog.

## Deployment

This app runs as a static site. GitHub Pages can serve it directly from the repository root.
