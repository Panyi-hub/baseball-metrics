import pandas as pd
import os
from pathlib import Path
from google.cloud import bigquery
import pandas_gbq
 

def finding_and_uploading_files():
    directory = 'baseballdatabank-2022.2/contrib/'

    # iterate over files in
    # that directory
    for filename in os.scandir(directory):
        if filename.is_file():
            files_path= (str(filename.path))    
            df = pd.read_csv(files_path)

            # file name with extension
            file_name = os.path.basename(files_path)

            # file name without extension
            file_name = (os.path.splitext(file_name)[0])

            # Set project_id to your Google Cloud Platform project ID.
            project_id = "panyi-sabermetrics"

            # Set table_id to the full destination table ID (including the dataset ID).
            table_id = f"panyi-sabermetrics.mlb_data.{file_name}"

            pandas_gbq.to_gbq(df, table_id, project_id=project_id)

       

if __name__ == "__main__":
    finding_and_uploading_files()

