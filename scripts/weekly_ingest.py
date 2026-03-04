#!/usr/bin/env python3
"""Weekly ingest stub.
Populate data/openclaw_weekly.db items from sources.
"""

from datetime import datetime, timezone
import sqlite3

DB = "/media/boilerrat/Bobby/openclaw-weekly/data/openclaw_weekly.db"


def main():
    con = sqlite3.connect(DB)
    con.execute("PRAGMA journal_mode=WAL")
    now = datetime.now(timezone.utc).isoformat(timespec="seconds")
    # TODO: add real ingest steps per source.
    print("OK ingest stub", now)


if __name__ == "__main__":
    main()
