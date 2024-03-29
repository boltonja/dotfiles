host=`hostname -s`
user=`whoami`
agfil=~/agent.$host
os=`uname -s`
agpid=`grep -s PID $agfil | sed 's/.*PID=\([0-9]*\)\; export.*/\1/'`
if [ "${agpid}" != "" ]
then
	ps up ${agpid} | grep "$user.*ssh-agent"
	if [ $? != 0 ]
	then
		echo "new agent"
		ssh-agent > ${agfil}
	fi
else
    echo "new agent"
    ssh-agent > ${agfil}
fi

. ${agfil}
