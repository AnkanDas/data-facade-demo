{% macro row_count(table, devicePlatform) %}

SELECT * FROM {table_name}

{% endmacro %}