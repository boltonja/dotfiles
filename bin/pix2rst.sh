#!/bin/sh
for i in `echo content/$1/* | sed 's/content\///g'`
do
    fn=`basename "$i"|sed 's/\..*$//'`
    echo "$fn|$i"
done |
    awk -F\| '
{
	printf("|" $1 "|\ ")
	arr[$1] = $2
}

END {
    printf("\n\n")

    for (f in arr) {
    	printf(".. |%s| image:: %s\n", f, arr[f])
	printf("   :width: 150px\n   :height: 150px\n")
	printf("   :target: %s\n", arr[f])
    }
}	
'
