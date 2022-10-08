
{% macro new_user_top_sectors(table, userType) %}

WITH Total AS(
SELECT count(*) AS user_count, 
EXTRACT(MONTH FROM TO_TIMESTAMP(
    "bookingDate",
    'YYYY-MM-DD HH24:MI:SS'
)) AS bookingMonth, 
CONCAT("originCode",'-',"destinationCode") as sectors, 
"userType"
FROM {table} 
GROUP BY "userType", sectors, bookingMonth
),
Agg AS (
SELECT 
COALESCE (SUM(user_count), 0) as total, 
COALESCE (SUM(user_count) FILTER (WHERE "userType" = {userType}), 0) AS target,
{userType} as UserType, sectors, bookingMonth
FROM Total
GROUP BY sectors, bookingMonth
)
SELECT (target*100)/total as percent_share, {userType} as UserType, sectors, bookingMonth FROM Agg

{% endmacro %}