-- Initial schema for Torske Klubben

CREATE TABLE members (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT
);

CREATE TABLE events (
    id INTEGER PRIMARY KEY,
    name TEXT,
    date INTEGER,
    place TEXT,
    cost INTEGER,
    description TEXT,
    map_link TEXT,
    deadline INTEGER
);

CREATE TABLE reservations (
    id INTEGER PRIMARY KEY,
    member_id INTEGER REFERENCES members(id),
    event_id INTEGER REFERENCES events(id),
    guests INTEGER,
    paid INTEGER,
    created_at INTEGER,
    stripe_payment_intent TEXT
);

CREATE TABLE invitations (
    id INTEGER PRIMARY KEY,
    event_id INTEGER REFERENCES events(id),
    member_id INTEGER REFERENCES members(id),
    status TEXT
);

CREATE TABLE guests (
    id INTEGER PRIMARY KEY,
    member_id INTEGER REFERENCES members(id),
    event_id INTEGER REFERENCES events(id),
    guest_name TEXT
);

CREATE TABLE email_groups (
    id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE email_group_members (
    id INTEGER PRIMARY KEY,
    group_id INTEGER REFERENCES email_groups(id),
    member_id INTEGER REFERENCES members(id)
);

CREATE TABLE contacts (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT
);

CREATE TABLE contact_groups (
    id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE contact_group_members (
    id INTEGER PRIMARY KEY,
    group_id INTEGER REFERENCES contact_groups(id),
    contact_id INTEGER REFERENCES contacts(id)
);

CREATE TABLE payments (
    id INTEGER PRIMARY KEY,
    event_id INTEGER REFERENCES events(id),
    member_id INTEGER REFERENCES members(id),
    total_lunches INTEGER,
    total_owed REAL,
    cash_amt REAL,
    check_amt REAL,
    card_amt REAL,
    cash_back REAL,
    balance_due REAL,
    notes TEXT,
    date_paid TEXT
);

CREATE TABLE reservation_changes (
    id INTEGER PRIMARY KEY,
    event_id INTEGER REFERENCES events(id),
    member_id INTEGER REFERENCES members(id),
    first_name TEXT,
    last_name TEXT,
    old_status TEXT,
    new_status TEXT,
    old_guests INTEGER,
    new_guests INTEGER,
    changed_by TEXT,
    changed_at TEXT,
    changed_at_unix INTEGER,
    email_sent INTEGER
);