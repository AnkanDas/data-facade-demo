{% macro table_count(table1) %}

select count(*) from {{table1}}

{% endmacro %}