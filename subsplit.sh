#!/bin/bash
[ $# -ge 1 -a -f "$1" ] && input="$1" || input="-"
urls=$(timeout 1s cat $input)
array=()
if ! [[ -z $urls ]]; then
        for line in ${urls}; do
                domin=$(echo $line | egrep '^https?://.+\.[A-Za-z0-9_-]+([:][8][0])?/' |  awk -F/ '{print $1,$3}' | sed -e 's/ /\/\//')
                if ! [[ ${array} =~ $domin ]]; then
                                echo $domin ; array+=($domin) ; fi
                   done
   else
        printf "\nusage: cat file.txt | $0 \n\n" ;fi
