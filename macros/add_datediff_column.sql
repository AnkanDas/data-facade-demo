{% macro calcolumn(table, new_column, column1, column2) %}

SELECT *, DATEDIFF(hour,toDateTime({{column1}}, 'UTC'),toDateTime({{column2}},'UTC')) AS {{new_column}}

FROM {{table}}

{% endmacro %}