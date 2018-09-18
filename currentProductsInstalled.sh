#!/bin/bash
./pivnet login --api-token=$1
./om -k -u $3  -p $4 -t $2 deployed-products  | cut -d "|" -f 2,3 |while read line
        do
            if ! [[ $line == *[+]* ]] && ! [[ $line == *"NAME"* ]] 
            then 
               productName="$(echo "$line" | cut -d "|" -f 1  | xargs | tr "\n" " ")"
               currentVersion="$(echo "$line" | cut -d "|" -f 2 | xargs | tr "\n" " ")"
               echo "Updating $productName $currentVersion"
	       ./updates.sh $productName $currentVersion
            fi 

       done
cat updatesAvailable.txt | column -t > formattedNicely.txt
