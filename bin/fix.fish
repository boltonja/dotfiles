#!/usr/bin/env fish
echo $WORK

if ! set -q WORK || test ! -d "$WORK"
	set WORK $HOME/Documents/Projects
end
set FIX $WORK/$argv[1]
if test x"$WORK/" = x"$FIX"
	echo "you must supply a checkout"
else
	if test ! -d $FIX
		echo "$FIX does not exist"
	else
		set -x SRC $FIX
	end
end
