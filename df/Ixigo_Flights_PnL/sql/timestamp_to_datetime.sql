select
*,
case 
when {timestamp_column} = 0 then toDateTime(null)
else toDateTime({timestamp_column}/1000)
end as {datetime_column}
from {table_name}
