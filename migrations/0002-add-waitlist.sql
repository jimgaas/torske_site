CREATE TABLE IF NOT EXISTS waitlist (
    id INTEGER PRIMARY KEY,
    event_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    created_at INTEGER NOT NULL,
    status TEXT NOT NULL DEFAULT 'waiting'
);
