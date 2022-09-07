{% macro calcolumn(table, new_column, column1, column2) %}

SELECT *, DATEDIFF(hour,{{column1}},{{column2}}) AS {{new_column}}
  
FROM {{table}}

{% endmacro %}