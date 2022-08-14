{% macro table_join_skey(table1, table2, keycolumn) %}

select * from {{table1}}
inner join {{table1}}
using {{keycolumn}}

{% endmacro %}
