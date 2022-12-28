SELECT 
toDate({booking_details_table}.{timestamp_column}/1000,'Asia/Kolkata') as date_time,
COUNT(*) as daily_total_transaction 
FROM {booking_details_table} 
GROUP BY date_time