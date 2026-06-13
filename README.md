# Panini World Cup 2026 Tracker

A static GitHub Pages web app for tracking the 2026 World Cup Panini sticker collection across four collectors: Claus, Holger, Karl-Eric, and Sam.

## Features

- Multi-collector tracking
- Album page, grid, missing list, and trade center views
- Local browser progress saving with optional GitHub Gist cloud sync
- Duplicate and trade matching
- Excel export with offline-compatible fallback
- JSON backup and restore
- Mobile-friendly layout with bottom navigation

Sticker metadata is sourced from Checklist Insider and stored locally in `checklist-insider-data.js`.

## Cloud Sync

The app is local-first. To sync across phones, tablets, and computers, open **Cloud Sync** in the app and connect a private GitHub Gist:

1. Create a GitHub token with `gist` access.
2. Use **Create Cloud File** on the first device, or paste an existing Gist ID.
3. On each other device, enter the same token and Gist ID, then use **Pull**.
4. Leave **Auto sync** enabled to push future changes automatically.

The GitHub token is stored only in that browser and is not included in JSON collection backups.

## Deployment

This app runs as a static site. GitHub Pages can serve it directly from the repository root.
