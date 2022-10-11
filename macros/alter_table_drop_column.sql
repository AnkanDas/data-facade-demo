{% macro drop_column(table1, column1) %}

SELECT * INTO temptable
FROM ixigo_analytics_data;
/* Drop the columns that are not needed */
ALTER TABLE temptable
DROP COLUMN {column1};
/* Get results and drop temp table */
SELECT * FROM temptable;

  {% endmacro %}