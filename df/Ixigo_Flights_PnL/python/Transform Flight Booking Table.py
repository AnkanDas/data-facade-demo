import collections
from ast import literal_eval
import pandas as pd


df = df_helper.get_table("input_table", "Input Table", "Input Raw Table","")
df = df.head(1000)
pax_types_column = 'pax_types_array'
df[pax_types_column] = df[pax_types_column].apply(literal_eval)
df[pax_types_column] = df[pax_types_column].apply({lambda x: collections.Counter(x)})
temp = df[pax_types_column].apply(pd.Series)
temp.columns = [f"{subcolumn}" for subcolumn in temp.columns]

df = pd.concat([df, temp], axis=1)
df.rename(columns = {'ADT':'adult_count', 'CHD':'child_count', 'INF': 'infant_count'}, inplace = True)

def function(x,y):
  return [i+'_'+j for i,j in zip(x,y)]

df['onward_segments_airline_codes_array'] = df['onward_segments_airline_codes_array'].apply(literal_eval)
df['onward_segments_flight_numbers_array'] = df['onward_segments_flight_numbers_array'].apply(literal_eval)
df['onward_segments_airlines'] = df.apply(lambda x: function(x['onward_segments_airline_codes_array'], x['onward_segments_flight_numbers_array']),axis=1)

df['return_segments_airline_codes_array'] = df['return_segments_airline_codes_array'].apply(literal_eval)
df['return_segments_flight_numbers_array'] = df['return_segments_flight_numbers_array'].apply(literal_eval)
df['return_segments_airlines'] = df.apply(lambda x: function(x['return_segments_airline_codes_array'], x['return_segments_flight_numbers_array']),axis=1)

df_helper.publish(df)
        