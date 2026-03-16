-- Initial schema for Torske Klubben

CREATE TABLE member (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    suffix TEXT,
    email TEXT
);

CREATE TABLE event (
    id INTEGER PRIMARY KEY,
    name TEXT,
    date INTEGER,
    place TEXT,
    cost INTEGER,
    description TEXT,
    map_link TEXT,
    deadline INTEGER
);

CREATE TABLE reservation (
    id INTEGER PRIMARY KEY,
    invitation_id INTEGER REFERENCES invitation(id),
    paid INTEGER,
    created_at INTEGER,
    stripe_payment_intent TEXT
);

CREATE TABLE invitation (
    id INTEGER PRIMARY KEY,
    event_id INTEGER REFERENCES event(id),
    member_id INTEGER REFERENCES member(id),
    status TEXT
);

CREATE TABLE guest (
    id INTEGER PRIMARY KEY,
    reservation_id INTEGER REFERENCES reservation(id),
    guest_name TEXT
);

CREATE TABLE email_group (
    id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE email_group_member (
    id INTEGER PRIMARY KEY,
    group_id INTEGER REFERENCES email_group(id),
    member_id INTEGER REFERENCES member(id)
);

CREATE TABLE contact (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT
);

CREATE TABLE contact_group (
    id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE contact_group_member (
    id INTEGER PRIMARY KEY,
    group_id INTEGER REFERENCES contact_group(id),
    contact_id INTEGER REFERENCES contact(id)
);

CREATE TABLE payment (
    id INTEGER PRIMARY KEY,
    reservation_id INTEGER REFERENCES reservation(id),
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

CREATE TABLE reservation_change (
    id INTEGER PRIMARY KEY,
    reservation_id INTEGER REFERENCES reservation(id),
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