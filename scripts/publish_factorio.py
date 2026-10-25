import os
import sys
from pathlib import Path

import requests

def main():
    name, version, package = sys.argv[1:]

    response = requests.get(
        f'https://mods.factorio.com/api/mods/{name}',
        timeout = 30,
    )

    response.raise_for_status()

    if any(r['version'] == version for r in response.json()['releases']):
        print(f'{name} {version} is already published.')
        return

    response = requests.post(
        'https://mods.factorio.com/api/v2/mods/releases/init_upload',
        headers = { 'Authorization': f'Bearer {os.environ['FACTORIO_API_KEY']}' },
        data = { 'mod': name },
        timeout = 30,
    )

    response.raise_for_status()

    upload_url = response.json()['upload_url']

    with Path(package).open('rb') as file:
        response = requests.post(
            upload_url,
            files = { 'file': file },
            timeout = 300,
        )

    response.raise_for_status()

    result = response.json()
    if not result.get('success'):
        raise RuntimeError(result)

    print(f'Published {name} {version}.')

if __name__ == '__main__':
    main()