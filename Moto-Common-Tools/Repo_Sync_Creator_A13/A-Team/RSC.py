import argparse
import xml.etree.ElementTree as ET

# Parse command line arguments
parser = argparse.ArgumentParser()
parser.add_argument('manifest_path', help='path to the manifest file')
args = parser.parse_args()

# Parse the manifest file
tree = ET.parse(args.manifest_path)
root = tree.getroot()

# Build a list of repository paths
repos = []
for child in root:
    if child.tag == 'project':
        repo_name = child.attrib['path']
        repos.append(repo_name)

# Generate the sync command
sync_command = 'repo sync '
for repo in repos:
    sync_command += repo + ' '

print(sync_command)

