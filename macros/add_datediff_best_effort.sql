{% macro calcolumn2(table, new_column, column1, column2) %}

SELECT *, DATEDIFF(hour,parseDateTimeBestEffort({{column1}}, 'UTC'),parseDateTimeBestEffort({{column2}},'UTC')) AS {{new_column}}

FROM {{table}}

{% endmacro %}