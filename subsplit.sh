#!/bin/bash
[ $# -ge 1 -a -f "$1" ] && input="$1" || input="-"
urls=$(timeout 1s cat $input)
if ! [[ -z $urls ]]; then
                echo "$urls" |  awk -F/ '{print $1,$3}' | sed -e 's/ /\/\//g' | sort | uniq
   else
        printf "\nusage: cat file.txt | $0 \n\n" ;fi
