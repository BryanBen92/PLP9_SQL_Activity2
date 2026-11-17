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

INSERT INTO passengers (passenger_id, name, current_location, destination, travel_date)
VALUES
    (1, 'Amina Diallo',   'Kigali, Rwanda',              'Nairobi, Kenya',               '2026-12-05'),
    (2, 'Kwame Mensah',   'Accra, Ghana',                'London, United Kingdom',       '2026-12-10'),
    (3, 'Zanele Nkosi',   'Johannesburg, South Africa',  'Dubai, United Arab Emirates',  '2026-12-15'),
    (4, 'Tunde Okafor',   'Lagos, Nigeria',              'Paris, France',                '2026-11-28');

INSERT INTO bookings
    (booking_id, passenger_id, class_tier, seat_preference,
     lounge_pass_code, suite_number, chauffeur_service)
VALUES
    (1, 1, 'Economy',  'Window', 'LP-ECO-3310', NULL,    0),
    (2, 2, 'Business', 'Aisle',  'LP-BUS-7742', NULL,    0),
    (3, 3, 'First',    'Window', 'LP-FST-9001', 'SUI-12A', 1),
    (4, 4, 'Economy',  'Aisle',  NULL,          NULL,    0);

SELECT * FROM passengers;
SELECT * FROM bookings;

SELECT
    p.passenger_id,
    p.name       AS passenger_name,
    b.class_tier,
    p.destination,
    p.travel_date
FROM passengers AS p
INNER JOIN bookings AS b ON p.passenger_id = b.passenger_id
WHERE b.class_tier IN ('Business', 'First')
ORDER BY b.class_tier DESC, p.name;
