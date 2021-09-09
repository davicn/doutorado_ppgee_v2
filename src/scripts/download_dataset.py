import pandas as pd
import os
from dotenv import load_dotenv

load_dotenv()

PATH = os.path.abspath('')

pwd = os.getenv('TUH_PASSWORD')
user = os.getenv('TUH_USER')
path_data = os.getenv('PATH_DATASET')

url = 'https://www.isip.piconepress.com/projects/tuh_eeg/downloads/tuh_eeg_seizure/v1.5.2/edf/'

folders = ['train/01_tcp_ar/','train/02_tcp_le/','train/03_tcp_ar_a/','dev/01_tcp_ar/','dev/02_tcp_le/','dev/03_tcp_ar_a/']

for folder in folders:
    cmd = f'wget -cr --no-parent  --http-user={user} --http-passwd={pwd} {url}{folder} -P {path_data}'
    os.system(cmd)



