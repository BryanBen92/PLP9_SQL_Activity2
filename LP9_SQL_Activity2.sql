.headers on
.mode column

PRAGMA foreign_keys = ON;

PRAGMA foreign_keys;

DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS passengers;

CREATE TABLE passengers (
    passenger_id     INTEGER PRIMARY KEY,
    name             TEXT NOT NULL,
    current_location TEXT,
    destination      TEXT,
    travel_date      TEXT
);

CREATE TABLE bookings (
    booking_id        INTEGER PRIMARY KEY,
    passenger_id      INTEGER NOT NULL,
    class_tier        TEXT NOT NULL
                      CHECK (class_tier IN ('Economy', 'Business', 'First')),
    seat_preference   TEXT,
    lounge_pass_code  TEXT,
    suite_number      TEXT,
    chauffeur_service BOOLEAN NOT NULL DEFAULT 0,

    FOREIGN KEY (passenger_id) REFERENCES passengers (passenger_id)
        ON UPDATE CASCADE
);
