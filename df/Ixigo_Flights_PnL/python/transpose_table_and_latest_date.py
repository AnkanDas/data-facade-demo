import pandas as pd

df = df_helper.get_table(parameter_name="input_table", parameter_display_name="Input Table", parameter_description="Input Raw Table")
datetime_column = df_helper.get_column(parameter_name="timestamp_column",parameter_display_name="Timestamp Column", parameter_description="Timestamp Column")
values =  df_helper.get_column_list(parameter_name="value_column",parameter_display_name="Metric Columns", parameter_description="Metric Columns")

table = pd.pivot_table(df, values = values, columns=[datetime_column], aggfunc='sum')

new_table= table[table.columns[-1]].reset_index()
df_helper.publish(pd.DataFrame(new_table))

