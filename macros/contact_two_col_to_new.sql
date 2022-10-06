{% macro concat_col_create(table1, column1, column2, new_col_name) %}

select *, concat({column1},'-',{column2}) as {new_col_name} from {{table1}}

{% endmacro %}