#!/bin/bash

#
# Copyright 2019-Present A-Team Digital Solutions
#

# Exports
out=$OUT_DIR/target/product/$DEVICE
if [ -f $out ]; # The path does not exist
then
	echo "The path to create changelog does not exist, exiting..."
	exit
fi

export Changelog=Changelog.txt

touch $Changelog

# Print something to build output
echo "Generating A-Team Custom Changelog..."

cp $Changelog $OUT_DIR/target/product/$DEVICE/system/etc/$Changelog
cp $Changelog $OUT_DIR/target/product/$DEVICE/
