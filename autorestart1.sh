#! /bin/bash

# Keep a given command alive forever
# Brian Cole
# 2014-04-19

STATUSFILE="autorestart1.status"

case "$1" in
	start)
		#first, make sure another copy's not already running:
		if test -f $STATUSFILE
		then
			echo Already running
			exit 1
		fi
		
		( sleep 4 ; echo hi ; sleep 11 ; echo there ) &

		echo $! > $STATUSFILE

#		while test -f autorestart1.status
#		do
#			( sleep 4 ; echo hi );
#		done
		#TODO keep running
		;;
	stop)
		kill $(cat $STATUSFILE)
		rm $STATUSFILE
		;;
esac

