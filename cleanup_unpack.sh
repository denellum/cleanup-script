#!/bin/bash
#############################################################
# CLEAN UP SCRIPT DESCRIPTION : 
#############################################################
# This script will go through a defined LOCATION and
# find directories with a ZIPPED file. When it finds a 
# ZIPPED file it will set that subdirectory to an array
# and loop through and find the unpacked file. If that 
# unpacked file is over X minues old, it's safe to assume
# it's been moved. When those checks all are okay, the 
# unpacked file will be deleted, assuming it's a 
# duplicate at that point.
#############################################################

#############################################################
# VERSIONING // CHANGELOG
#############################################################
# v_1.0 - Initial Script. -denellum
# v_1.1 - Original Fixes, was late when created. - denellum
#############################################################

#############################################################
# VARBIABLES - You might been to change some of these.
#############################################################
LOCATION="/mnt/user/Media/incomplete/"
UNPACKED_FILES="*mkv"
ZIPPED="*rar"
LOCATION_WITH_ZIPPED=($(find "$LOCATION" -type f -name "$ZIPPED" | sed -r 's|/[^/]+$||' |sort |uniq))
# Age is in minues.
FILEAGE="360"
#############################################################

#############################################################
# ACTUAL SCRIPT
#############################################################

for i in ${LOCATION_WITH_ZIPPED[@]};
do
     find $i -name *"$UNPACKED_FILES" -type f -mmin +"$FILEAGE" -delete
done

