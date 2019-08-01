#!/bin/sh
###echo "fix $1:  I hope you sourced me"
if [ "$WORK" = "" -o ! -d "$WORK" ]
then
WORK=$HOME/Documents/Projects
fi
FIX=$WORK/$1
if [ "$WORK/" = "$FIX" ]
then
   echo "you must supply a fixid"
else
if [ ! -d $FIX ]
then
	echo "$FIX does not exist"
else
	SRC=$FIX
#	DT=/path/to/debug/bin
#	RT=/path/to/release/bin
	export SRC
fi
fi
