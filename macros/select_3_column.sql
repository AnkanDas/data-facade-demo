{% macro sel_3_column(table1, column_x, column_y, column_z) %}

select {{ column_x }}, {{ column_y }}, {{column_z}} from {{ table1 }}

{% endmacro %}