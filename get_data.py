from zipfile import ZipFile
import wget


def get_file_from_url():
    URL = "https://github.com/chadwickbureau/baseballdatabank/archive/refs/tags/v2022.2.zip"
    file_name = wget.download(URL)
    return file_name

def extracting_files(file_name):
    
    # opening the zip file in READ mode
    with ZipFile(file_name, 'r') as zip:
    
        # extracting all the files
        print('Extracting all the files now...')
        all_files = zip.extractall()
        print('Done!')
        return all_files


if __name__ == "__main__":
    file_name = get_file_from_url()
    extracting_files(file_name=file_name)