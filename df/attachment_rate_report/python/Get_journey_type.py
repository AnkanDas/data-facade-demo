"""
Inputs:
    - data: Transformed data  in the form of dataframe
    - journey_column_info: Column required to create new journey column
    - new_column_name: Name of the new created column
Output:
    - Data in the form of dataframe with the new column
"""
import numpy as np
import pandas as pd
from dft.base_execution_handler import BaseExecutionHandler


class ExecutionHandler(BaseExecutionHandler):
    def execute(self, data, created_column_name, compare_column = 'origin'):
        try:
            data[created_column_name] = np.where(data[compare_column+'_x']==data[compare_column+'_y'], 'onward', 'return')

        except Exception as e:
            raise type(e)(e)

        return data
