#!/bin/sh
find . -type d -print >> /tmp/thumb.$$


MYDIR=`pwd`
while read f
do
   cd "$MYDIR/$f"
	ls -1 *[JGgjPp][PiIpNn][FfGg] |grep -v '^t-' | while read pic
	do
DOTHUMB="Y"
        if [ $# -gt 0 ]
        then
	if [ "$1" -eq "-n" ] 
	then 
		if [ -f "t-$pic" ]
		then
DOTHUMB="N"
		fi
	fi
        fi

	if [ "$DOTHUMB" = "Y" ]
	then
		convert -scale 128 "$pic" "t-$pic"
	fi
	done
   chmod 644 t-*
done < /tmp/thumb.$$

rm -f /tmp/thumb.$$

exit 0
