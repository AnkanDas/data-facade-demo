{% macro drop_column(table1, column1) %}

ALTER TABLE table1
  DROP COLUMN column1;

  {% endmacro %}