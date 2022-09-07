{% macro table_join(table1, new_column, column1, column2) %}

ALTER TABLE {{table1}}

ADD {{new_column}} AS DATEDIFF(minute,{{column1}},{{column2}})

{% endmacro %}