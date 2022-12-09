from dft.base_execution_handler import BaseExecutionHandler


class ExecutionHandler(BaseExecutionHandler):
    def execute(self, df, column_to_remove_name, column_to_be_renamed = None):
        final_df = df.drop(column_to_remove_name, 1)
        if column_to_be_renamed:
            final_df.rename(columns = {column_to_be_renamed:column_to_remove_name}, inplace = True)
        return final_df
    