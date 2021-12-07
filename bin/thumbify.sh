#!/bin/sh
find . -type d -print >> /tmp/thumb.$$


MYDIR=`pwd`
while read f
do
   cd "$MYDIR/$f"
#   /home/creel/bin/jpgtn -W -s 128 -p 't-' *[Jj][Pp][Gg]
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

#for i in *JPG; do if [ ! -f t-$i ]; then echo $i; fi; done|grep -v '^t-'|while read f; do sudo convert -scale 128 $f t-$f; chown skeeter:users $f t-$f; chmod 644 $f t-$f; done
