#!/usr/bin/env bash

# Create the not on phone directory
not_on_phone_dir=./not_on_phone
[[ -d $not_on_phone_dir ]] || mkdir $not_on_phone_dir

# Download the video
link=$1
youtube-dl -x --embed-thumbnail --audio-format "mp3" -o 'not_on_phone/%(title)s.%(ext)s' "$link"
