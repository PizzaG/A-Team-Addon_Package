#!/bin/bash

# Remove Prior Log
rm -rf Linux_log.txt >/dev/null 2>&1

# Go Into A-Team Folder
cd A-Team

# Start Log & Run Installer Scrupt
echo ""
script -c ./LINUX.sh -f ../Linux_log.txt

# Exit After Completion
exit
