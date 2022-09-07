{% macro calcolumn(table, new_column, column1, column2) %}

ALTER TABLE {{table}}

ADD COLUMN {{new_column}} 
date_time MATERIALIZED DATEDIFF(hour,{{column1}},{{column2}})

{% endmacro %}