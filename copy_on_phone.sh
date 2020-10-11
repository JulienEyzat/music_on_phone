#!/usr/bin/env bash

# Path
MNT_DIRECTORY=./phone_mnt
NOKIA_DIRECTORY=./phone_mnt/Playlists
ON_PHONE_DIRECTORY=on_phone/
NOT_ON_PHONE_FILES=not_on_phone/*

# Mount phone
echo "Mounting phone"
# Create the mount directory if not exists already
[[ -d $MNT_DIRECTORY ]] || mkdir $MNT_DIRECTORY
simple-mtpfs --device 1 "$MNT_DIRECTORY"
if [ $? -ne 0 ]
then
    echo "Mount failed"
    exit 1
else
    echo "Mounted"
fi

# Copy on the phone
echo "Copying files on phone"
cp $NOT_ON_PHONE_FILES "$NOKIA_DIRECTORY"

# Move the new musics on the on_phone directory
echo "Move files to not on phone directory"
[[ -d $ON_PHONE_DIRECTORY ]] || mkdir $ON_PHONE_DIRECTORY
mv $NOT_ON_PHONE_FILES "$ON_PHONE_DIRECTORY"

# Unmount phone
echo "Unmounting phone"
fusermount -u "$MNT_DIRECTORY"
if [ $? -ne 0 ]
then
    echo "Unmount failed"
    exit 1
else
    echo "Unmounted"
fi
