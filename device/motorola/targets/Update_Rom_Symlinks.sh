#!/bin/bash

#
# Copyright 2019-Present A-Team Digital Solutions
# Copyright 2023 Electimon
#

echo "Updating Rom Symlinks..."
echo ""

ROM_DIR="rom"
DEVICE_DIR="devices"

if [ ! -d $ROM_DIR ] || [ ! -d $DEVICE_DIR ]; then
  exit 1
fi

for device in $DEVICE_DIR/*; do
  for file in $ROM_DIR/*; do
    ln -sf "../../$file" "$device/$(basename ${file%.*})_$(basename $device).mk"
  done
done

echo "Rom Symlinks Updated & Rom Added  =)"
echo ""
echo ""
echo "PRESS ENTER TO EXIT"
read
