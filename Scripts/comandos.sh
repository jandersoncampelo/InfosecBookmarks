----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
amass enum -d $TARGET -o amass.txt

subfinder -d $TARGET -v -t 50 -nW -o "$SUBS"/subfinder.txt -rL "$IPS/"resolvers.txt

subfinder -d $TARGET -v -t 50 -nW -o subfinder.txt

assetfinder -subs-only $TARGET  | tee assetfinder.txt

  "$HOME"/go/bin/subfinder -d "$domain" -v -exclude-sources dnsdumpster -t 50 "$domain" -nW -o "$SUBS"/subfinder.txt -rL "$IPS/"resolvers.txt
  "$HOME"/go/bin/assetfinder --subs-only "$domain" >"$SUBS"/assetfinder.txt
  "$HOME"/go/bin/amass enum -d "$domain" -o "$SUBS"/amass.txt


cat *.txt | sort | awk '{print tolower($0)}' | uniq > final-subdomains.txt
cat final-subdomains.txt | httprobe | tee hosts.txt
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  echo -e "[$GREEN+$RESET] Combining and sorting results.."
  cat "$SUBS"/*.txt | sort -u >"$SUBS"/subdomains
  cat "$SUBS"/subdomains | massdns -r "$IPS"/resolvers.txt -t A -o S -w "$SUBS"/alive-massdns.txt 2>/dev/null
  cat "$SUBS"/alive-massdns.txt | cut -d " " -f 1 | sed 's/.$//' | sed '/\*/d' > "$SUBS"/subdomains
  rm "$SUBS"/alive-massdns.txt
  cat "$SUBS"/subdomains | dnsgen - | massdns -r "$IPS"/resolvers.txt -t A -o S -w "$SUBS"/dnsgen.txt 2>/dev/null
  cat "$SUBS"/dnsgen.txt | cut -d " " -f 1 | sed 's/.$//' | sed '/\*/d' | sort -u >> "$SUBS"/subdomains
  "$HOME"/go/bin/httprobe <"$SUBS"/subdomains | tee "$SUBS"/hosts
  echo -e "[$GREEN+$RESET] Done."
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
subjack -a -ssl -t 50 -v -c ~/go/src/github.com/haccer/subjack/fingerprints.json -w $SUB_PATH/final-subdomains.txt -o $SUB_PATH/final-takeover.tmp
cat final-takeover.tmp | grep -v "Not Vulnerable" > final-takeover.txt
rm final-takeover.tmp
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python /root/tools/CORScanner/cors_scan.py -v -t 50 -i final-subdomains.txt | tee final-cors.txt
python /root/tools/CORStest/corstest.py final-subdomains.txt 
python3 /root/tools/Corsy/corsy.py -i hosts.txt -d 2 -o corsy.json
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
cat final-subdomains.txt | aquatone -http-timeout 10000 -scan-timeout 300 -ports xlarge -out aquatone/
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

altdns -i final-subdomains.txt -w /root/tools/altdns/words.txt -o new_subdomains.txt -r -s resolved_subdomains.txt

Zone transfer, DNS lookups & reverse lookups
dig +multi AXFR target.com dig +multi AXFR $ns_server target.com

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

$TOOLS_PATH/massdns/bin/massdns -r $TOOLS_PATH/massdns/lists/resolvers.txt -q -t A -o S -w $IP_PATH/massdns.raw $SUB_PATH/final-subdomains.txt

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
cat final-subdomains.txt | aquatone -http-timeout 10000 -scan-timeout 300 -ports xlarge -out /root/hunting/kindred/casinohuone.com/aquatone/ 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
python3 /root/tools/dirsearch/dirsearch.py -b -t 100 -e php,asp,aspx,jsp,html,zip,jar,sql -x 500,503 -r -w /usr/share/seclists/Discovery/Web-Content/big.txt -u api.casinohuone.com/ --plain-text-report=./fqdn.tmp

