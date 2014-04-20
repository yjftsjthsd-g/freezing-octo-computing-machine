#! /bin/bash

# Keep a given command alive forever
# Brian Cole
# 2014-04-19

STATUSFILE="autorestart1.status"
COMMAND=" ( sleep 4 ; echo hi ; sleep 11 ; echo there ) "

case "$1" in
	start)
		#first, make sure another copy's not already running:
		if test -f $STATUSFILE
		then
			echo Already running
			exit 1
		fi
		

#		while test -f autorestart1.status
#		do
#			( sleep 4 ; echo hi );
#		done

		./keeprunning.sh $COMMAND &

		echo $! > $STATUSFILE #put PID of keeprunning in status file

		;;
	stop)
		kill $(cat $STATUSFILE)
		rm $STATUSFILE
		;;
esac

