{% macro sel_2_column(table1, column_x, column_y) %}

select {{ column_x }}, {{ column_y }} from {{ table1 }}

{% endmacro %}