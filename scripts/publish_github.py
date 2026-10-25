import json
import os
import subprocess
import sys
from pathlib import Path

def gh(*args):
    return subprocess.check_output(['gh', *args], text=True)

def main():
    name, version, package = sys.argv[1:]
    tag = f'v{version}'

    pages = json.loads(gh(
        'api', '--paginate', '--slurp',
        f'repos/{os.environ['GH_REPO']}/releases?per_page=100',
    ))

    release = next(
        (r for page in pages for r in page if r['tag_name'] == tag),
        None,
    )

    if release is None:
        gh(
            'release', 'create', tag,
            '--target', os.environ['GITHUB_SHA'],
            '--title', f'{name} {version}',
            '--notes-file', 'dist/release-notes.txt',
            '--draft',
        )

    release = json.loads(gh(
        'release', 'view', tag, '--json', 'assets,isDraft',
    ))

    if not any(a['name'] == Path(package).name for a in release['assets']):
        gh('release', 'upload', tag, package)

    if release['isDraft']:
        gh('release', 'edit', tag, '--draft=false')

    print(f'Published {tag}.')

if __name__ == '__main__':
    main()