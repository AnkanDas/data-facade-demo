import traceback
from dft.base_execution_handler import BaseExecutionHandler
import pandas as pd


class ExecutionHandler(BaseExecutionHandler):
    def execute(self, data, trip_id, journey_info_column, claim_amount, premium_amount):
        try:
            table = data.groupby([trip_id, journey_info_column]).agg({premium_amount:'sum', claim_amount:'sum'}).unstack().fillna(0)
            new_cols = []
            for prefix,suffix in table.columns:
                if len(suffix)>0:
                    new_cols.append(f'{prefix}_{suffix}')
                else:
                    new_cols.append(prefix)
            
            table.columns = new_cols

        except Exception as e:
            print(e)
            print(traceback.format_exc())
            raise

        return table.reset_index()