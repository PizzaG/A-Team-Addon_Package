#!/bin/bash

#
# Copyright 2019-Present A-Team Digital Solutions
#
# A-Team Moto-Common Telegram Notification Bot Addon
#
# Bot Version: 0.02"
# Bot Update Date: 12-22-2023"
#


# Telegram Bot Variables - **User Adaptable**
CHANNEL_ID='YOUR_CHANNEL_ID_HERE'  # Chat ID
BOT_TOKEN='YOUR_BOT_TOKEN_HERE'


# Device Specific Thread Topic Variables - **User Adaptable**
AMOGUS_THREAD_ID='YOUR_MESSAGE_THREAD_ID'
BORNEO_THREAD_ID='YOUR_MESSAGE_THREAD_ID'
GUAMNA_THREAD_ID='YOUR_MESSAGE_THREAD_ID'
MILANF_THREAD_ID='YOUR_MESSAGE_THREAD_ID'
OSAKA_THREAD_ID='YOUR_MESSAGE_THREAD_ID'    


# if the first argument is "-h" for help.
# display the usage information
if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` \"text message\""
  exit 0
fi

# Warn if the first argument is empty.
if [ -z "$1" ]; then
    echo "Add message text as the second argument"
    exit 0
fi

# Warn if more than one argument is passed to the script.
if [ "$#" -ne 1 ]; then
    echo "You can pass only one argument. For string with spaces, put it on quotes"
    exit 0
fi

# send a POST request to Telegram's API
# The '-s' = "silent" mode
# redirect outputs to /dev/null

# Amogus
if [[ $DEVICE_NAME == Amogus ]]
then
curl -s --data "text=$1" --data "chat_id=$CHANNEL_ID" --data "message_thread_id=$AMOGUS_THREAD_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null. follow instructions to create bot & get token to access the HTTP API.

# Borneo
elif [[ $DEVICE_NAME == Borneo ]]
then
curl -s --data "text=$1" --data "chat_id=$CHANNEL_ID" --data "message_thread_id=$BORNEO_THREAD_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null. follow instructions to create bot & get token to access the HTTP API.

# Guamna
elif [[ $DEVICE_NAME == Guamna ]]
then
curl -s --data "text=$1" --data "chat_id=$CHANNEL_ID" --data "message_thread_id=$GUAMNA_THREAD_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null. follow instructions to create bot & get token to access the HTTP API.

# Milanf
elif [[ $DEVICE_NAME == Milanf ]]
then
curl -s --data "text=$1" --data "chat_id=$CHANNEL_ID" --data "message_thread_id=$MILANF_THREAD_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null. follow instructions to create bot & get token to access the HTTP API.

# Osaka
elif [[ $DEVICE_NAME == Osaka ]]
then
curl -s --data "text=$1" --data "chat_id=$CHANNEL_ID" --data "message_thread_id=$OSAKA_THREAD_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null. follow instructions to create bot & get token to access the HTTP API.
fi
