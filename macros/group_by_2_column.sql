{% macro sel_2_col_group(table1, column_x, column_y) %}

select {{ column_x }}, AVG({{ column_y }}) 
from {{ table1 }}
GROUP BY {{column_x}}

{% endmacro %}