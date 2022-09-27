{% macro sel_3_column_groupby(table1, column_x, column_y, column_z) %}

select {column_x}, {column_y}, sum({column_z}) as {total_column} from {table1}
Group by {column_x}, {column_y}

{% endmacro %}