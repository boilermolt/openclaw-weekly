PRAGMA journal_mode=WAL;

CREATE TABLE IF NOT EXISTS items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  type TEXT NOT NULL,               -- skill | use_case | integration | tool | post
  source TEXT NOT NULL,             -- clawhub | github | substack | x | reddit | web
  url TEXT,
  summary TEXT,
  notes TEXT,
  tags TEXT,
  novelty_score REAL,               -- 0-1
  utility_score REAL,               -- 0-1
  risk_score REAL,                  -- 0-1
  score REAL,                       -- weighted total
  first_seen_at TEXT,
  last_seen_at TEXT
);

CREATE INDEX IF NOT EXISTS items_source ON items(source);
CREATE INDEX IF NOT EXISTS items_score ON items(score);
CREATE INDEX IF NOT EXISTS items_last_seen ON items(last_seen_at);

CREATE TABLE IF NOT EXISTS weekly_posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  week_start TEXT NOT NULL,
  week_end TEXT NOT NULL,
  title TEXT NOT NULL,
  draft_path TEXT,
  created_at TEXT NOT NULL,
  notes TEXT
);

CREATE TABLE IF NOT EXISTS item_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  item_id INTEGER,
  event_type TEXT NOT NULL,         -- discovered | updated | shortlisted | featured
  event_time TEXT NOT NULL,
  note TEXT,
  FOREIGN KEY(item_id) REFERENCES items(id)
);
