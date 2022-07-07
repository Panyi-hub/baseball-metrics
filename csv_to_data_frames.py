from pickle import APPEND, TRUE
import pandas as pd
import os
from pathlib import Path
from google.cloud import bigquery
import pandas_gbq
 

def finding_and_uploading_files():
    lst_of_folders = ["contrib","core","upstream"]
    for folder in lst_of_folders:
        directory = f'baseballdatabank-2022.2/{folder}/'

        # iterate over files in
        # that directory
        for filename in os.scandir(directory):
            if filename.is_file():
                files_path= (str(filename.path))    
                df = pd.read_csv(files_path)

                # handling if there is an invalid column name for table creaton             
                df.columns = '_'+df.columns
                print(df.columns)
                    
                # file name with extension
                file_name = os.path.basename(files_path)

                # file name without extension
                file_name = (os.path.splitext(file_name)[0])

                # Set project_id to your Google Cloud Platform project ID.
                project_id = "panyi-sabermetrics"

                # Set table_id to the full destination table ID (including the dataset ID).
                table_id = f"panyi-sabermetrics.mlb_data.{folder}_{file_name}"
                pandas_gbq.to_gbq(df, table_id, project_id=project_id, if_exists="append")

               
                       

if __name__ == "__main__":
    finding_and_uploading_files()

