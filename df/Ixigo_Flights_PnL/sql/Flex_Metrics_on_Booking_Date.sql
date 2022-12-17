SELECT 
toDate({booking_details_table}.{timestamp_column}/1000,'Asia/Kolkata') as date_time, 
COUNT(*) as total_flex_sold,
SUM({reschedule_policy_table}.{passanger_id_column}) as total_passangers,
SUM({booking_details_table}.{order_amount_column}) as total_order_amount,
total_order_amount/total_passangers as pax_wise_ATV,
SUM({reschedule_policy_table}.{premium_amount_column}) as total_premium,
total_premium/total_flex_sold as avg_premium_per_felx,
total_premium/total_passangers as avg_premium_per_passanger,
avg_premium_per_passanger/pax_wise_ATV as flex_fee_as_percent_of_ATV
FROM {booking_details_table}
LEFT JOIN {reschedule_policy_table}
ON {booking_details_table}.{booking_details_id} = {reschedule_policy_table}.{reschedule_policy_id}
WHERE {booking_details_table}.{free_reschedule_column} = 1
GROUP BY date_time