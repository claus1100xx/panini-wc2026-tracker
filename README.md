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

The app is local-first. To sync across phones, tablets, and computers without a personal device token, connect Supabase:

1. Create a free Supabase project.
2. Open Supabase SQL Editor and run `supabase-schema.sql`.
3. In the app, open **Cloud Sync** and choose **Supabase background sync**.
4. Enter the Supabase Project URL, public anon key, and a shared family sync code.
5. Click **Create / Update Cloud** on the first device.
6. On each other device, enter the same Supabase values and family sync code, then click **Pull**.
7. Leave **Auto sync** enabled to push future changes automatically.

The Supabase anon key is public by design. The family sync code is stored only in that browser and is not included in JSON collection backups.

GitHub Gist sync remains available as a fallback from the same **Cloud Sync** dialog.

## Deployment

This app runs as a static site. GitHub Pages can serve it directly from the repository root.
