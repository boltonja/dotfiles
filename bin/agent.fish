#!/usr/bin/env fish
set host (hostname -s)
set user (whoami)
set agfil ~/agent.$host
set agpid (grep PID $agfil | sed 's/.*PID=\([0-9]*\)\; export.*/\1/')
if test -n $agpid
	echo looking for $agpid
	ps xu | grep "^$user"'[^0-9][^0-9]*'"$agpid.*ssh-agent"
	if test $status != 0
		echo "new agent"
		ssh-agent > $agfil
	end
end

set cmd (sed -e 's/export.*//g' -e 's/\(.*\)=\(.*\)/set -x \1 \2/' $agfil)
eval $cmd
