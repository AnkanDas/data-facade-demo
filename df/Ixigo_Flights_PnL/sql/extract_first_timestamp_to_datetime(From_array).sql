select
*,
case 
when {timestamp_column} = 0 then toDateTime(null)
else toDateTime(toDateTime(arrayElement({timestamp_column},1)/1000)
end as {datetime_column}
from {table_name}
