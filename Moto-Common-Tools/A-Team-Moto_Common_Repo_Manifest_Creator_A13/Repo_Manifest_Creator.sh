#!/bin/bash

#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#
# Moto-Common Repo Manifest Creator
#

# Step 1 - Run this from terminal
echo "Please Run ls .repo/manifests/snippets From Rom Root & Take Note Of Output"
echo ""
echo ""
echo "PRESS ENTER TO CONTINUE"
read

clear

# Step 2 - Drop manifests folder from .repo into A-Team Folder
echo "Please Copy & Drop manifests Folder From .repo Into A-Team Folder"
echo ""
echo ""
echo "PRESS ENTER TO CONTINUE"
read

clear

# Step 3 - Run Manifest Creator
echo "Open Repo_Manifest_Creator.sh & Add xml File Names Into Manifest Build Command Section"
echo ""
echo ""
echo "-Static File Names-" 
echo "RMC.py" 
echo "default.xml" 
echo "a-remove.xml" 
echo "Remainder Of File Names Dependent On Output Of ls .repo/manifests/snippets Command" 
echo ""
echo ""
echo "PRESS ENTER TO CONTINUE & BUILD NEW MANIFEST"
read

clear

# Folder Setup
rm -rf A-Team/local_manifests
mkdir A-Team/local_manifests
cp -r A-Team/moto-common.xml A-Team/local_manifests

# Manifest Build Command
python3 A-Team/RMC.py A-Team/manifests/default.xml A-Team/manifests/snippets/lineage.xml A-Team/manifests/snippets/pixel.xml A-Team/local_manifests/moto-common.xml A-Team/local_manifests/a-lineage_13.xml

# Move local_manifest Folder
mv A-Team/local_manifests local_manifests

# GoodBye Message
echo "New local_manifests Folder Should Be Created & Goes In .repo Folder"
echo ""
echo ""
echo "PRESS ENETR TO EXIT"
read
rm -rf A-Team/manifests
