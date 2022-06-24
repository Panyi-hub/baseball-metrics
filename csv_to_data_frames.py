import pandas as pd
import os
from pathlib import Path
 

def finding_files():
    directory = 'baseballdatabank-2022.2/core/'

    # iterate over files in
    # that directory
    for filename in os.scandir(directory):
        if filename.is_file():
            files= (str(filename.path))
            print(files)
    
    df = pd.read_csv(files)
    print(df.head())
            
    
    

if __name__ == "__main__":
    finding_files()

