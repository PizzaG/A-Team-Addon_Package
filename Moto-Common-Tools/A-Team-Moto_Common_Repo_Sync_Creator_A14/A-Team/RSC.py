import argparse
import os
import xml.etree.ElementTree as ET
import logging
import glob

def parse_arguments():
    parser = argparse.ArgumentParser(description='Generate a single repo sync command from all XML manifest files in a directory.')
    parser.add_argument('directory', help='Directory containing XML manifest files.')
    parser.add_argument('--save', help='Save the sync command to a file.', action='store_true')
    parser.add_argument('--verbose', help='Increase output verbosity.', action='store_true')
    return parser.parse_args()

def setup_logging(verbose):
    if verbose:
        logging.basicConfig(level=logging.DEBUG)
    else:
        logging.basicConfig(level=logging.INFO)

def parse_manifest(manifest_path):
    try:
        tree = ET.parse(manifest_path)
        root = tree.getroot()
        return root
    except ET.ParseError as e:
        logging.error(f"Error parsing manifest file '{manifest_path}': {e}")
        return None

def extract_repos(root):
    return [child.attrib['path'] for child in root if child.tag == 'project']

def save_command_to_file(command, file_name='sync_repos.sh'):
    with open(file_name, 'w') as file:
        file.write("#!/bin/bash\n")
        file.write(command + "\n")
    logging.info(f"Sync command saved to {file_name}")

def main():
    args = parse_arguments()
    setup_logging(args.verbose)

    # Use glob to find XML files in the specified directory and all subdirectories
    xml_files = glob.glob(os.path.join(args.directory, '**', '*.xml'), recursive=True)
    
    if not xml_files:
        logging.error(f"No XML manifest files found in '{args.directory}' and its subdirectories.")
        exit(1)

    all_repos = []
    for xml_file in xml_files:
        logging.info(f"Parsing {xml_file}")
        root = parse_manifest(xml_file)
        if root:
            repos = extract_repos(root)
            all_repos.extend(repos)

    if all_repos:
        unique_repos = list(set(all_repos))  # Remove duplicates
        sorted_repos = sorted(unique_repos)  # Sort repositories alphabetically
        sync_command = 'repo sync ' + ' '.join(sorted_repos)
        print(sync_command)
        if args.save:
            save_command_to_file(sync_command)
    else:
        logging.warning("No repositories found across all XML files.")

if __name__ == '__main__':
    main()
