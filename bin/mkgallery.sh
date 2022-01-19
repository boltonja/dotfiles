#!/bin/bash
find . -type f -exec dirname \{\} \; |sort -u | while read d
do
    if [ ! -f "$d"/index.html ]
    then
	chmod 755 "$d"
	pushd "$d"
	basename "$d" | $HOME/bin/htmlify3.sh
	"$HOME/bin/thumbify.sh"
	popd
    fi
done
