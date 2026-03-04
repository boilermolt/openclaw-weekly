#!/usr/bin/env bash
set -euo pipefail
LOG="/media/boilerrat/Bobby/openclaw-weekly/output/cron.log"
if [[ ! -f "$LOG" ]]; then
  echo "no log"
  exit 1
fi

tail -n 20 "$LOG"
