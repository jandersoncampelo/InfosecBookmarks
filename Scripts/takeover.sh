#!/bin/sh
filename=$1

echo "Subjack"
subjack -a -ssl -t 50 -v -c ~/go/src/github.com/haccer/subjack/fingerprints.json -w $filename -o "$filename"-takeover.tmp
cat "$filename"-takeover.tmp | grep -v "Not Vulnerable" > "$filename"-takeover.txt
rm "$filename"-takeover.tmp

#./sudomainTakeover.sh subs.txt
