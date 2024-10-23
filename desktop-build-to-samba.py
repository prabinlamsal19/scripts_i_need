import requests
import logging
import os
import datetime

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

try:
    GITHUB_TOKEN = os.getenv('GITHUB_TOKEN')
except: 
    print('Please set an environment variable for GITHUB_TOKEN in your ~/.bashrc file')
    print("          export GITHUB_TOKEN='your_github_token'         ")

OWNER = 'sageflick'
REPO = 'edm_flutter'
ASSET_NAME_PARTIAL = 'EDM-Windows-x64-'  
SAVE_PATH = '/home/user/Documents/pos-device-samba'

if not os.path.exists(SAVE_PATH):
    os.makedirs(SAVE_PATH)

try:
    release_url = f"https://api.github.com/repos/{OWNER}/{REPO}/releases/latest"
    headers = {
        'Authorization': f'token {GITHUB_TOKEN}',
        'Accept': 'application/vnd.github.v3+json'
    }

    logging.info(f"Fetching latest release from {release_url}...")
    response = requests.get(release_url, headers=headers)
    response.raise_for_status()  
    release_data = response.json()
except requests.exceptions.RequestException as e:
    logging.error(f"Error fetching release: {e}")
    exit()

asset_url = None
try:
    for asset in release_data['assets']:
        if  ASSET_NAME_PARTIAL in asset['name']:
            asset_url = asset['url']
            logging.info(f"Found asset URL: {asset_url}")
            break

    if not asset_url:
        logging.error('Asset not found!')
        exit()
except KeyError:
    logging.error('Invalid response structure while fetching assets.')
    exit()

try:
    download_headers = {
        'Authorization': f'token {GITHUB_TOKEN}',
        'Accept': 'application/octet-stream'
    }

    logging.info(f"Downloading asset from {asset_url}...")
    download_response = requests.get(asset_url, headers=download_headers)
    download_response.raise_for_status()

    today = datetime.datetime.now()
    new_asset_name = ASSET_NAME_PARTIAL+today.strftime("%Y-%B-%d")
    file_path = os.path.join(SAVE_PATH, new_asset_name)
    with open(file_path, 'wb') as f:
        f.write(download_response.content)

    logging.info(f'{new_asset_name} downloaded successfully to {file_path}!')

except requests.exceptions.RequestException as e:
    logging.error(f"Error downloading asset: {e}")
    exit()

