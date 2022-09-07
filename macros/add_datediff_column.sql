{% macro calcolumn(table, new_column, column1, column2) %}

ALTER TABLE {{table}}

ADD {{new_column}} AS DATEDIFF(minute,{{column1}},{{column2}})

{% endmacro %}