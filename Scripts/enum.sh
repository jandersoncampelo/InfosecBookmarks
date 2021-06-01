#!/bin/sh
filename=$1
while read line; do
        echo "Subfinder"
        #python3 sublist3r.py -d $line -o $line.txt
        subfinder -d $line -v -t 50 -nW -o $line.txt
        echo "Assetfinder"
        assetfinder --subs-only $line | tee -a $line.txt

        sort -u $line.txt -o $line.txt
done < $filename
#./enumSubdomains.sh subs.txt
