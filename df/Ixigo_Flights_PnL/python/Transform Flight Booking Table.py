import collections
from ast import literal_eval
import pandas as pd

df = df_helper.get_table("input_table", "Input Table", "Input Raw Table","")
pax_types_column = 'pax_types_array'
df[pax_types_column] = df[pax_types_column].apply(literal_eval)
df[pax_types_column] = df[pax_types_column].apply({lambda x: collections.Counter(x)})
temp = df[pax_types_column].apply(pd.Series)
temp.columns = [f"{subcolumn}" for subcolumn in temp.columns]

df = pd.concat([df, temp], axis=1)
df.rename(columns = {'ADT':'adult_count', 'CHD':'child_count', 'INF': 'infant_count'}, inplace = True)

[code + '_' + number for code, number in zip(df['onward_segments_airline_codes_array'], df['onward_segments_flight_numbers_array'])]

df_helper.publish(df)
        