{% macro users_who_booked_platforms(table, devicePlatform) %}

WITH Total AS(
    SELECT count(*) AS total_bookings
    FROM {table} 
    WHERE "devicePlatform" = {devicePlatform}
    GROUP BY "userId"
    ),
Agg AS (
    SELECT 
    SUM(total_bookings) AS No_of_users,
    {devicePlatform} as devicePlatform
FROM Total
WHERE total_bookings >= 2
)
SELECT * FROM Agg