#!/bin/sh

# get rid of the cursor so we don't see it when videos are running
setterm -cursor off

# set here the path to the directory containing your videos
VIDEOPATH="/media/pi/YDIGITAL" 

# you can normally leave this alone
SERVICE="omxplayer"

# now for our infinite loop!
while true; do
	if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
		echo "NEED $SERVICE"
        	sleep 1;
	else
		echo "READ $VIDEOPATH"
        	for entry in $VIDEOPATH/*
        	do
                	clear
                	omxplayer --refresh $entry
        	done
	fi
done
