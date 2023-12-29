#!/bin/bash

#
# Copyright 2019-Present A-Team Digital Solutions
#
# A-Team Moto-Common Bot Message
#

expect - <<_END_EXPECT
spawn sudo ./Telegram_Bots/Telegram_Bot-$DEVICE_NAME.sh "

Hello A-Team Users, 

A New Custom Rom Has Been Released On SourceForge📱👍😁

• $ROM_ZIP_NAME $MAJOR_VERSION.$MINOR_VERSION | UNOFFICIAL 

📱 Moto-Common Device Codename:  $DEVICE_NAME

📅 Build Date: $BUILD_DATE
🔄 Android: $ANDROID_VERSION
📀 Build Type: $ROM_BUILD_TYPE
🔐 SeLinux: Permissive | Enforcing
📀 A-Team Version: $INTERNAL_VERSION
👨‍💻 Maintainer: @PizzaG

• Uses A-Team Custom Rom Installer
-Option To Disable Encryption
-Recovery Install
-Linux Install
-Windows Install

• Rom Installation
  *WILL WIPE DATA*
-Flash Rom Zip From Recovery
 OR
-Extract Rom Zip
-Run .sh file To Flash Device - Linux
 OR
-Run .bat File To Flash Device - Windows
-After A-Team Installation Finishes In Rom,
 Open Magisk Manager and Select Magisk Direct Install
-🥸Done!!👍😁

• Rom Download Link 
- https://sourceforge.net/projects/a-team-rom-downloads/files/$DEVICE_NAME/$ROM_NAME.zip

• A-Team Changelog:
-$CHANGELOG

• Navigation Bar Spacing WorkAround
-Open Settings
-Select System
-Select Gestures
-Select Navigation Mode
-Select Gesture Navigation
-Select 3-Button Navigation
-Go Back To Home/Desktop
-NavBar Spacing Should Be Fixed Now

• Known Bugs:
-$BUGS

• Bug Tracker For Moto-Common Devices
- https://github.com/moto-common/bug_tracker
"
expect "Pass*"
send "$pass\r"
set timeout -1  ; # no timeout
expect eof
_END_EXPECT
