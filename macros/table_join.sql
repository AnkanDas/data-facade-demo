{% macro three_columns(table1, table2, keycolumn1, keycolumn2) %}

select * from {{table1}}
inner join {{table1}}
on {{table1}}.{{keycolumn1}} = {{table2}}.{{keycolumn2}}

{% endmacro %}
