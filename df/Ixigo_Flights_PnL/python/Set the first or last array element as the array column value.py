import pandas as pd
import numpy as np

from ast import literal_eval

df = df_helper.get_table("input_table", "Input Table", "Input Raw Table","")

array_columns = df_helper.get_column("array_column","Array Columns", "Array Column", [])

position = df_helper.get_integer("position", "position", "Array Postion", 0)

if not isinstance(array_columns, list):
    print("Input is not a list. Converting it to a list")
    array_columns = [array_columns]

# TODO: Remove this line before using it in production.
# df = df.head(1000)

for column in array_columns:
 # Add validtion to ensure it's a valid time column. Raise warning if it's not. 
    print("converting "+ str(column))
    df[column] = df[column].apply(literal_eval)
    df[column] = df[column].apply({lambda x: x[position]})


# new_df = df[array_columns]
df_helper.publish(df)

