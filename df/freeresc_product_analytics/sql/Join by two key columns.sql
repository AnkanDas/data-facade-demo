SELECT *
FROM {table1}
JOIN {table2}
--ON {table1}.{key_column1}={table2}.{key_column1}
--AND {table1}.{key_column2}={table2}.{key_column2}
USING ({key_column1},{key_column2})