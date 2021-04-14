#!/usr/bin/env bash
# list the pids that have "files" open
sudo ls -l /proc/[0-9]*/fd| awk -F\> '
/^\/.*:$/ {
     split($0,arr,"/");
}
/->/ {
     files[$2][arr[3]] = $2
}
END {
     for (file in files) {
          printf("%s:",file);
	  for (pid in files[file]) {
	       printf(" %s", pid)
	  }
          printf("\n");
     };
}'
