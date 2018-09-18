#!/bin/bash
#curVer = "$2"
#prodName = "$1"
COUNTER=0
echo -e -n "$1 \t\t | $2 \t | " >> updatesAvailable.txt

./pivnet releases -p $1 | cut -d "|" -f 3 | grep [0-9] |while read line
        do
         retVal=$(./compareVersions.sh $2 $line)
            if [ "$retVal" = "<" ]; then
                if ! [ "$COUNTER" = "0" ]; then
                    echo -n "|" >> updatesAvailable.txt
                fi
		COUNTER=$[$COUNTER +1]
		echo -n " $line  " >> updatesAvailable.txt
            fi
       done 

echo " " >> updatesAvailable.txt



