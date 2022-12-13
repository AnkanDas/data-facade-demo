import pandas as pd

df = df_helper.get_table("input_table", "Input Table", "Input Raw Table","")

time_columns = df_helper.get_column("timestamp_column","Timestamp Column", "Timestamp Column", "")

unit = df_helper.get_string("unit", "Unit of timestamp", "Unit of timestamp", "ms")

print(time_columns)
if not isinstance(time_columns, list):
    print("Input is not a list. Converting it to a list")
    time_columns = [time_columns]

for column in time_columns:
 # Add validtion to ensure it's a valid time column. Raise warning if it's not. 
    df[column] = pd.to_datetime(df[column],unit=unit)
new_df = df.head(1000)
df_helper.publish(new_df)
