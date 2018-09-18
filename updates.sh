#!/bin/bash
#curVer = "$2"
#prodName = "$1"
echo -n "$1  installed: $2  - Updates Available:" >> updatesAvailable.txt
./pivnet releases -p $1 | cut -d "|" -f 3 | grep [0-9] |while read line
        do   
            retVal=$(./compareVersions.sh $2 $line)
            if [ "$retVal" = "<" ]; then
               echo -n " $line " >> updatesAvailable.txt
            fi
       done 

echo " " >> updatesAvailable.txt



