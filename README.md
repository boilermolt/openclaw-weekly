# openclaw-weekly

Weekly “Best of OpenClaw” pipeline: collect notable skills/use‑cases/integrations and publish a Wednesday‑morning brief.

## Structure
- `data/` — SQLite DB + caches
- `scripts/` — ingest + scoring + report
- `docs/` — notes + source list
- `output/` — generated drafts

## DB (local‑first)
Default path:
```
/media/boilerrat/Bobby/openclaw-weekly/data/openclaw_weekly.db
```

Initialize:
```bash
sqlite3 /media/boilerrat/Bobby/openclaw-weekly/data/openclaw_weekly.db < scripts/schema.sql
```
