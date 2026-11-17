-- Task 4: INNER JOIN - Ticket Receipt

SELECT
    p.name AS passenger_name,
    p.destination,
    b.class_tier,
    CASE
        WHEN b.class_tier = 'Economy'
            THEN 'Standard seat and basic service'
        WHEN b.class_tier = 'Business'
            THEN 'Extra space, priority boarding, and lounge access'
        WHEN b.class_tier = 'First'
            THEN 'Private suite, chauffeur service, and premium lounge access'
    END AS class_perks
FROM passengers AS p
INNER JOIN bookings AS b
    ON p.passenger_id = b.passenger_id
ORDER BY p.passenger_id;
