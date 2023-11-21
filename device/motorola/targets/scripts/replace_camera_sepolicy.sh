#!/bin/bash

#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

shopt -s extglob
read -p "This Will Patch Rom Camera SePolicy, Ctrl-C To Exit, Enter To Continue."
echo ""
find device/!(*qcom)/sepolicy -type f -exec sed -i "/vendor.camera.aux.packagelist/s/.*//" {} \;
if [ $? -eq 0 ]; then
	echo "Patch 1, Done!"
else
	echo "Patch 1, Failed..."
fi
find device/!(*qcom)/sepolicy -type f -exec sed -i "/system_vendor_config_prop(vendor_persist_camera_prop)/s/.*//" {} \;
if [ $? -eq 0 ]; then
	echo "Patch 2, Done!"
else
	echo "Patch 2, Failed..."
fi
