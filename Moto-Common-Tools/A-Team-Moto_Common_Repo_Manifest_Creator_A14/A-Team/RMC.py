import argparse, pathlib
import xml.etree.ElementTree as ET

def indent(elem, level=0):
  i = "\n" + level*"  "
  if len(elem):
    if not elem.text or not elem.text.strip():
      elem.text = i + "  "
    if not elem.tail or not elem.tail.strip():
      elem.tail = i
    for elem in elem:
      indent(elem, level+1)
    if not elem.tail or not elem.tail.strip():
      elem.tail = i
  else:
    if level and (not elem.tail or not elem.tail.strip()):
      elem.tail = i

# parse arguments
parser = argparse.ArgumentParser(description='Remove duplicates from a repo manifest file')
parser.add_argument('input_manifest_files', metavar='default.xml', help='Path to input ROM manifest XML files', nargs='+')
parser.add_argument('moto_common_xml_dir', metavar='moto_common_xml_dir', help='Path to Moto-Common manifest XML dir')
parser.add_argument('output', metavar='output', help='Path to output manifest file')
parser.add_argument('--removal-keywords', metavar='keyword', nargs='+', default=["st-hal"],
                    help='Keywords to match for removal of duplicates')
parser.add_argument('--replacement-keywords', metavar='keyword', nargs='+', default=["qcom-caf/common"],
                    help='Keywords to match for replacement of duplicates')
parser.add_argument('--remote-name', metavar='name', default='moto-common',
                    help='Name of the remote to be added at the beginning of the output manifest')
parser.add_argument('--remote-url', metavar='url', default='https://github.com/moto-common/',
                    help='URL of the remote to be added at the beginning of the output manifest')
args = parser.parse_args()

root = ET.Element('manifest')

# Parse input XML files
for manifest_file in args.input_manifest_files:
    try:
        tree = ET.parse(manifest_file)
        manifest_root = tree.getroot()
        for child in manifest_root:
            root.append(child)
    except ET.ParseError:
        print(f"Failed to parse {manifest_file}, skipped!")

tree1 = ET.ElementTree(root)
root1 = tree1.getroot()

# Parse Moto-Common XML files
# tree2 = ET.parse(args.moto_common_xml)
# root2 = tree2.getroot()
root2 = ET.Element('manifest')
for file in pathlib.Path(args.moto_common_xml_dir).rglob('*.xml'):
    try:
        tree = ET.parse(file)
        manifest_root = tree.getroot()
        for child in manifest_root:
            root2.append(child)
    except ET.ParseError:
        print(f"Failed to parse {file}, skipped!")

# Get the list of paths in the second manifest
paths2 = [project.get('path') for project in root2.findall('project')]

# Define the list of keywords for replacements and removals
replacements_keywords = {'qcom-caf/common': {
    "name": "platform_hardware_qcom-caf_common",
    "revision": "master"
}}
removals_keywords = [
    'st-hal',
    'data-ipa-cfg-mgr',
    'qcom-caf/thermal',
    'opensource/thermal',
    'opensource/audio-hal',
    'timekeep',
    'fm-commonsys',
    'core-utils-vendor'
] + list(replacements_keywords.keys())

# Create the new_root, manifest
new_root = ET.Element('manifest')

# Define the moto-common remote
remote = ET.Element('remote', {'name': 'moto-common', 'fetch': 'https://github.com/moto-common/'})
new_root.append(remote)

# Find duplicates and replacements in the first manifest
duplicates = {}
replacements = {}
# Track removals for deduplication
removals = []
for project in root1.findall('project'):
    path = project.get('path')
    name = project.get('name')
    linkfile_elems = [x for x in project.findall('linkfile') if not "sepolicy" in x.get("src") or not "sepolicy" in x.get("dest")]
    if path in paths2:
        if path not in duplicates:
            duplicates[path] = [name]
        else:
            duplicates[path].append(name)
    else:
        for keyword in replacements_keywords:
            if keyword in path:
                if path not in replacements:
                    replacements[path] = {
                        'name': replacements_keywords[keyword]['name'],
                        'linkfiles': linkfile_elems,
                        'revision': replacements_keywords[keyword]['revision']
                    }
                else:
                    # Only replace with the shortest path match
                    if len(path) < len(replacements[path]['path']):
                        replacements[path] = {
                            'name': replacements_keywords[keyword]['name'],
                            'linkfiles': linkfile_elems,
                            'revision': replacements_keywords[keyword]['revision']
                        }
        for keyword in removals_keywords:
            if keyword in path:
                remove = ET.Element('remove-project')
                remove.set('name', name)
                if name not in removals:
                    new_root.append(remove)
                    removals.append(name)
                break

# Create a new manifest with remove-project and project elements
projects = []
for project in root1.findall('project'):
    path = project.get('path')
    name = project.get('name')
    if path in duplicates and name in duplicates[path]:
        remove = ET.Element('remove-project')
        remove.set('name', name)
        if name not in removals:
            new_root.append(remove)
            removals.append(name)
    elif path in replacements:
        new_project = ET.Element('project')
        new_project.set('path', path)
        new_project.set('name', replacements[path]['name'])
        new_project.set('remote', "moto-common")
        new_project.set('revision', replacements[path]['revision'])
        for linkfile_elem in replacements[path]['linkfiles']:
            new_project.append(linkfile_elem)
        projects.append(new_project)

# Add the remove-project elements at the end of the new manifest
for project in projects:
    new_root.append(project)

indent(new_root)
# Write the new manifest to a file
ET.ElementTree(new_root).write(args.output, xml_declaration=True, encoding='UTF-8', method='xml', short_empty_elements=True)
