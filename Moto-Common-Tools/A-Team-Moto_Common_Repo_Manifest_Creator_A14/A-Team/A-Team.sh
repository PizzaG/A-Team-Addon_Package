#!/bin/bash

#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2024 Electimon
#
# Moto-Common Repo Manifest Creator
#

APP_NAME="A-Team Moto-Common Repo Manifest Creator" 

# Date
date=$(date -u +%-m/%d/%Y)

# Print Rom Name To Terminal
echo -ne "\033]0;$APP_NAME\007"

# Copyright & Current Date Stamp
echo ""
echo "Copyright 2019-Present A-Team Digital Solutions"
echo "            Current Date: $date"
echo "" 

sleep 7
clear

# Step 1-2 - Copy & Paste manifests Folder
echo "" 
echo "Step 1- Copy manifests Folder From Rom .repo Folder"
echo "Step 2- Paste manifests Folder Into manifests_FOLDER_GOES_HERE"
echo ""
echo ""
echo "WHEN YOU HAVE DONE THIS, PRESS ENTER TO CONTINUE"
read

clear

# Selection Menu
echo ""
echo "=========   Menu Selection   ========"
echo "-------------------------------------"
echo "       Tool Version: 0.12           -"
echo "   Tool Frontend Author: PizzaG     -"
echo "  PY Script & Manifest: Electimon   -"
echo "      Release Group: A-Team         -"
echo "-------------------------------------"
echo "-------------------------------------"
echo "1 =>  Create local_manifests Folder -"
echo "2 =>  EXIT                          -"
echo "-------------------------------------"
echo "- Select Your Option & PRESS ENTER  -"
echo "-------------------------------------"
read selection

clear

# Option 1- Create Local_Manifests Folder
if [[ $selection == 1 ]]
then
clear
echo ""
echo "Creating local_manifests Folder..."
echo ""
# Folder Setup
rm -rf local_manifests
mkdir local_manifests
cp -r moto-common.xml local_manifests
cp -r fragments local_manifests

# Manifest Build Command
if [[ -d ../manifests_FOLDER_GOES_HERE/manifests/snippets ]]
then
python3 RMC.py ../manifests_FOLDER_GOES_HERE/manifests/default.xml ../manifests_FOLDER_GOES_HERE/manifests/snippets/* local_manifests local_manifests/a-remove.xml
else
python3 RMC.py ../manifests_FOLDER_GOES_HERE/manifests/default.xml ../manifests_FOLDER_GOES_HERE/manifests/* local_manifests local_manifests/a-remove.xml
fi

# Sanity Check
if [[ -f local_manifests/a-remove.xml ]]
then
# Move local_manifests Folder
mv local_manifests ../local_manifests
rm -rf ../manifests_FOLDER_GOES_HERE/manifests
echo "New local_manifests Folder Created & Goes In Rom .repo Folder"
echo ""
echo ""
echo "PRESS ENETR TO EXIT"
read
else
echo "Manifest Creator Failed, Please Try Again"
echo ""
echo ""
echo "PRESS ENETR TO EXIT"
read
fi

# Option 2- EXIT
elif [[ $selection == 2 ]]
then
clear
exit

else
clear
echo ""
echo "Wrong Option, Please Try Again..."
sleep 5
clear && exec $0
fi
############################
