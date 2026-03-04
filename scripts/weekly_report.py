#!/usr/bin/env python3
"""Weekly report stub.
Reads top items and writes a draft markdown in output/.
"""

from datetime import datetime, timezone
import sqlite3
from pathlib import Path

DB = "/media/boilerrat/Bobby/openclaw-weekly/data/openclaw_weekly.db"
OUT_DIR = Path("/media/boilerrat/Bobby/openclaw-weekly/output")


def main():
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    con = sqlite3.connect(DB)
    rows = con.execute(
        "SELECT title, type, source, url, summary, score FROM items ORDER BY score DESC LIMIT 10"
    ).fetchall()

    now = datetime.now(timezone.utc).date().isoformat()
    out = OUT_DIR / f"openclaw_weekly_{now}.md"

    lines = [
        f"# Best of OpenClaw — Week of {now}",
        "",
        "## Top picks",
        "",
    ]
    for r in rows:
        title, typ, source, url, summary, score = r
        lines.append(f"- **{title}** ({typ} / {source})")
        if summary:
            lines.append(f"  - {summary}")
        if url:
            lines.append(f"  - {url}")
        if score is not None:
            lines.append(f"  - score: {score:.2f}")
    out.write_text("\n".join(lines))
    print(out)


if __name__ == "__main__":
    main()
