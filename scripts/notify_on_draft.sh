#!/usr/bin/env bash
set -euo pipefail
OUT_DIR="/media/boilerrat/Bobby/openclaw-weekly/output"
LATEST=$(ls -t "$OUT_DIR"/openclaw_weekly_*.md 2>/dev/null | head -n 1 || true)
if [[ -z "$LATEST" ]]; then
  exit 0
fi

MSG="OpenClaw Weekly draft ready: $LATEST"
openclaw message send --to telegram:759387314 --message "$MSG"
