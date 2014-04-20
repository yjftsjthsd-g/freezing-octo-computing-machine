#! /bin/bash

# Keep a given command alive forever
# Brian Cole
# 2014-04-19

#first, make sure another copy's not already running:
if test -f autorestart0.status
then
	echo Already running
	return 1
fi

#if not, mark that we're running
touch autorestart0.status

#and keep the target command running for as long as our status file is there
#TODO this doesn't kill the target program when our control file is deleted; we just stop restarting
while test -f autorestart0.status
do
	( sleep 4 ; echo hi );
done
