#!/bin/bash

#
# Copyright 2019-Present A-Team Digital Solutions
#
# A-Team Moto-Common Bot Message
#

# Bot Message
bot_message() {
  expect - <<_END_EXPECT
  set timeout 360 ;  # set timeout to 6 minutes
  spawn sudo ./Telegram_Bots/Telegram_Bot-$UPLOAD_DEVICE_NAME.sh "

  Hello Fellow A-Team Members, 

  📱 --->> New Rom Released On $SERVICE 📱


  • $ROM_ZIP_NAME $MAJOR_VERSION.$MINOR_VERSION | UNOFFICIAL 


  📱 Moto-Common Device Codename:  $UPLOAD_DEVICE_NAME

  📅 Build Date: $BUILD_DATE
  🔄 Android: $UPLOAD_ANDROID_VERSION
  📀 Build Type: $UPLOAD_BUILD_TYPE
  🔐 SeLinux: Permissive | Enforcing
  📀 A-Team Version: $UPLOAD_INTERNAL_VERSION
  👨‍💻 Maintainer: YOUR_NAME


  • A-Team Custom Rom Installer Features
  -5 Custom Recovery Options
  -3 Root Options
  -Enable / Disable Encryption Option
  -Recovery Installer
  -ADB Sideload Compatible
  -Linux Installer
  -Windows Installer


  • Rom Installation
    *WILL WIPE DATA*

  -From Recovery
   -Transfer Rom Zip To External SD Card
   -Format Data From Recovery(yes option)
   -Install Rom Zip

   OR

  -From ADB Sideload
   -Ensure ADB Installed And Working
   -Open Terminal In Rom Location
   -Run Command: 
    adb shell twrp format data
    adb sideload $UPLOAD_ROM_NAME

   OR

  -From Linux
   -Extract Rom Zip
   -Run .sh file To Flash Device From Linux

   OR

  -From Windows
   -Extract Rom Zip
   -Run .bat File To Flash Device From Windows

  -After Rom Installation And Device Boots,
   -Open Magisk Manager
   -Select Magisk Direct Install
   -Reboot
   -🥸Done!!👍😁


  • Rom Download Link 
  - YOUR/DOWNLOAD/URL/$UPLOAD_DEVICE_NAME/$UPLOAD_ROM_NAME


  • A-Team Changelog:
  -$CHANGELOG


  • Known Rom Bugs:
  -$BUGS


  • Developer Donate Links
  - YOUR_DONATE_LINK
  "
  expect {
      "assword" {
          send "$SUDO_PASS\r"
          set timeout -1 ;  # remove timeout for the rest of the process
          exp_continue
      }
      timeout {
          puts "Timeout Occurred While Waiting For Password Prompt."
          exit 1
      }
      eof {
          puts "End Of File Reached."
      }
  }
_END_EXPECT
}

bot_message    
