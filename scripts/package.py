"""Packages the necessary repo contents into a factorio mod zip file ready for release."""

import json
import os
import re
import textwrap
import zipfile
from pathlib import Path

# Script Config
OUTPUT_DIRECTORY = 'dist'

# These are the files / folders that should be packaged
PACKAGE_CONTENTS = [
    # Folders
    'graphics',
    'locale',
    'modules',
    'prototypes',

    # Files
    'changelog.txt',
    'data.lua',
    'info.json',
    'readme.md',
    'resource_generation.lua',
    'thumbnail.png',
]

def main():
    mod_info = json.loads(Path('info.json').read_text())

    name = mod_info['name']
    version = mod_info['version']

    # Ensure output directory exists
    Path(OUTPUT_DIRECTORY).mkdir(exist_ok=True)

    # Create changelog for later actions steps
    changelog = Path('changelog.txt').read_text()
    entries = re.split(r'(?m)^-{10,}[ \t]*$', changelog)
    notes = next(
        entry.strip()
        for entry in entries
        if re.search(
            rf'(?m)^Version: {re.escape(version)}[ \t]*$',
            entry
        )
    )
    notes = textwrap.dedent("\n".join(
        line for line in notes.splitlines()
        if not line.startswith(('Version:', 'Date:'))
    )).strip()
    
    Path(f'{OUTPUT_DIRECTORY}/release-notes.txt').write_text(notes + '\n')

    package_name = f"{name}_{version}"
    package_path = f"{OUTPUT_DIRECTORY}/{package_name}.zip"

    files = set()

    for content in PACKAGE_CONTENTS:
        for path in Path('.').glob(content):
                if path.is_dir():
                    files.update(p for p in path.rglob("*") if p.is_file())
                else:
                     files.add(path)

    with zipfile.ZipFile(package_path, "w", zipfile.ZIP_DEFLATED) as archive:
        for path in sorted(files):
            archive.write(path, f'{package_name}/{path.as_posix()}')

    print(f'Created package: {package_path}')

    if output_file := os.environ.get("GITHUB_OUTPUT"):
        with open(output_file, 'a') as outfile:
            outfile.write(f'name={name}\n')
            outfile.write(f'version={version}\n')
            outfile.write(f'zip={package_path}\n')

if __name__ == '__main__':
    main()