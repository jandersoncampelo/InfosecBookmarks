#!/bin/bash

VERSION="1.0"

TARGET=$1

WORKING_DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
TOOLS_PATH="$WORKING_DIR/tools"
WORDLIST_PATH="$WORKING_DIR/wordlists"
RESULTS_PATH="$WORKING_DIR/hunting/$TARGET"
SUB_PATH="$RESULTS_PATH/subdomain"
CORS_PATH="$RESULTS_PATH/cors"
IP_PATH="$RESULTS_PATH/ip"
PSCAN_PATH="$RESULTS_PATH/portscan"
SSHOT_PATH="$RESULTS_PATH/screenshot"
DIR_PATH="$RESULTS_PATH/directory"
WAYBACKMACHINE="$WORKING_DIR/hunting/$TARGET/waybackmachine"

RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

displayLogo(){
echo "
██████╗ ███████╗ ██████╗ ██████╗ ███╗   ██╗
██╔══██╗██╔════╝██╔════╝██╔═══██╗████╗  ██║
██████╔╝█████╗  ██║     ██║   ██║██╔██╗ ██║
██╔══██╗██╔══╝  ██║     ██║   ██║██║╚██╗██║
██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚████║
╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══  
${RED}v$VERSION${RESET} by ${YELLOW}@JandersonCampelo${RESET}
"
}

checkArgs(){
    if [ $# -eq 0 ]; then
        echo "${RED}[+] Usage:${RESET} $0 <domain>\n"
        exit 1
    fi
}

runBanner(){
    name=$1
    echo "${RED}\n[+] Running $name...${RESET}"
}

setupDir(){
    echo "${GREEN}--==[ Setting things up ]==--${RESET}"
    echo "${RED}\n[+] Creating results directories...${RESET}"
    rm -rf $RESULTS_PATH
    mkdir -p $SUB_PATH $CORS_PATH $IP_PATH $PSCAN_PATH $SSHOT_PATH $DIR_PATH
    echo "${BLUE}[*] $SUB_PATH${RESET}"
    echo "${BLUE}[*] $CORS_PATH${RESET}"
    echo "${BLUE}[*] $IP_PATH${RESET}"
    echo "${BLUE}[*] $PSCAN_PATH${RESET}"
    echo "${BLUE}[*] $SSHOT_PATH${RESET}"
    echo "${BLUE}[*] $DIR_PATH${RESET}"
    #echo "${BLUE}[*] $WAYBACKMACHINE${RESET}"
}

enumSubs(){
    echo "${GREEN}\n--==[ Enumerating subdomains ]==--${RESET}"
    runBanner "Amass"
    amass enum -d $TARGET -o "$SUB_PATH"/amass.txt
    #amass enum -norecursive -noalts -d $TARGET > "$SUB_PATH"/amass.txt

    runBanner "subfinder"
    #subfinder -d $TARGET -v -t 50 -nW -o "$SUBS"/subfinder.txt -rL "$IPS/"resolvers.txt
    subfinder -d $TARGET -v -t 50 -nW -o "$SUBS"/subfinder.txt

    echo "${RED}\n[+] Combining subdomains...${RESET}"
    cat $SUB_PATH/*.txt | sort | awk '{print tolower($0)}' | uniq > $SUB_PATH/final-subdomains.txt
    echo "${BLUE}[*] Check the list of subdomains at $SUB_PATH/final-subdomains.txt${RESET}"

    echo "${GREEN}\n--==[ Checking for alives subdomains ]==--${RESET}"
    cat $SUB_PATH/final-subdomains.txt | httprobe | tee $SUB_PATH/final-hosts.txt
    echo "${BLUE}[*] Check HTTPROBE result at $SUB_PATH/final-hosts.txt${RESET}"

    echo "${GREEN}\n--==[ Checking for subdomain takeovers ]==--${RESET}"
    runBanner "subjack"
    subjack -a -ssl -t 50 -v -c ~/go/src/github.com/haccer/subjack/fingerprints.json -w $SUB_PATH/final-subdomains.txt -o $SUB_PATH/final-takeover.tmp
    #subjack    -ssl -t 100  -c ~/go/src/github.com/haccer/subjack/fingerprints.json -w $SUB_PATH/final-subdomains.txt -timeout 30  -v 3
    cat $SUB_PATH/final-takeover.tmp | grep -v "Not Vulnerable" > $SUB_PATH/final-takeover.txt
    rm $SUB_PATH/final-takeover.tmp
    echo "${BLUE}[*] Check subjack's result at $SUB_PATH/final-takeover.txt${RESET}"
}

hostalive(){
    echo "${GREEN}\n--==[ Probing for live hosts... ]==--${RESET}"
    runBanner "HTTProbe"
    cat $SUB_PATH/final-subdomains.txt | sort -u | httprobe -c 50 -t 3000 >> $SUB_PATH/responsive.txt
    cat $SUB_PATH/responsive.txt | sed 's/\http\:\/\///g' |  sed 's/\https\:\/\///g' | sort -u | while read line; do
    probeurl=$(cat $SUB_PATH/responsive.txt | sort -u | grep -m 1 $line)
    echo "$probeurl" >> $SUB_PATH/urllist.txt
    done
    echo "$(cat $SUB_PATH/urllist.txt | sort -u)" > $SUB_PATH/urllist.txt
    echo "${BLUE}[*] Total of $(wc -l $SUB_PATH/urllist.txt | awk '{print $1}') live subdomains were found${reset}"
}

corsScan(){
    echo "${GREEN}\n--==[ Checking CORS configuration ]==--${RESET}"
    runBanner "CORScanner"
    python3 $TOOLS_PATH/CORScanner/cors_scan.py -v -t 50 -i $SUB_PATH/final-subdomains.txt | tee $CORS_PATH/CORScaner-results.txt
    python3 $TOOLS_PATH/Corsy/corsy.py -i /$SUB_PATH/final-hosts.txt -t 20 -d 2 | tee $CORS_PATH/corsy-result.txt
    echo "${BLUE}[*] Check the result at $CORS_PATH/${RESET}"
}

visualRecon(){
    echo "${GREEN}\n--==[ Taking screenshots ]==--${RESET}"
    runBanner "aquatone"
    cat $SUB_PATH/final-subdomains.txt | aquatone -http-timeout 10000 -scan-timeout 300 -ports xlarge -out $SSHOT_PATH/aquatone/
    echo "${BLUE}[*] Check the result at $SSHOT_PATH/aquatone/aquatone_report.html${RESET}"
}

enumIPs(){
    echo "${GREEN}\n--==[ Resolving IP addresses ]==--${RESET}"
    runBanner "massdns"
    $TOOLS_PATH/massdns/bin/massdns -r $TOOLS_PATH/massdns/lists/resolvers.txt -q -t A -o S -w $IP_PATH/massdns.raw $SUB_PATH/final-subdomains.txt
    cat $IP_PATH/massdns.raw | grep -e ' A ' |  cut -d 'A' -f 2 | tr -d ' ' > $IP_PATH/massdns.txt
    cat $IP_PATH/*.txt | sort -V | uniq > $IP_PATH/final-ips.txt
    #sed 's/A.*//' livehosts.txt | sed 's/CN.*//' | sed 's/\..$//' > live_subdomains.txt ### Faz o inverso da linha acima, deixa apenas os subdomínios online

    echo "${BLUE}[*] Check the list of IP addresses at $IP_PATH/final-ips.txt${RESET}"
}

waybackrecon() {
    #echo "${GREEN}\n--==[ Running WaybackRecon]==--${RESET}"
    #runBanner "waybackurls"
    cat $SUB_PATH/urllist.txt | waybackurls >> $WAYBACKMACHINE/waybackurls.txt

    cat $WAYBACKMACHINE/waybackurls.txt  | sort -u | unfurl --unique keys > $WAYBACKMACHINE/paramlist.txt

    cat $WAYBACKMACHINE/waybackurls.txt  | sort -u | grep -P "\w+\.js(\?|$)" | sort -u > $WAYBACKMACHINE/jsurls.txt

    cat $WAYBACKMACHINE/waybackurls.txt  | sort -u | grep -P "\w+\.php(\?|$)" | sort -u > $WAYBACKMACHINE/phpurls.txt

    cat $WAYBACKMACHINE/waybackurls.txt  | sort -u | grep -P "\w+\.aspx(\?|$)" | sort -u > $WAYBACKMACHINE/aspxurls.txt

    cat $WAYBACKMACHINE/waybackurls.txt  | sort -u | grep -P "\w+\.jsp(\?|$)" | sort -u > $WAYBACKMACHINE/jspurls.txt
}


portScan(){
    echo "${GREEN}\n--==[ Port-scanning targets ]==--${RESET}"
    runBanner "masscan"
    sudo masscan -p 1-65535 --rate 10000 --wait 0 --open -iL $IP_PATH/final-ips.txt -oX $PSCAN_PATH/masscan.xml
    xsltproc -o $PSCAN_PATH/final-masscan.html $TOOLS_PATH/nmap-bootstrap.xsl $PSCAN_PATH/masscan.xml
    open_ports=$(cat $PSCAN_PATH/masscan.xml | grep portid | cut -d "\"" -f 10 | sort -n | uniq | paste -sd,)
    echo "${BLUE}[*] Masscan Done! View the HTML report at $PSCAN_PATH/final-masscan.html${RESET}"

    runBanner "nmap"
    sudo nmap -sVC -p $open_ports --open -v -T4 -Pn -iL $SUB_PATH/final-subdomains.txt -oX $PSCAN_PATH/nmap.xml
    xsltproc -o $PSCAN_PATH/final-nmap.html $PSCAN_PATH/nmap.xml
    echo "${BLUE}[*] Nmap Done! View the HTML report at $PSCAN_PATH/final-nmap.html${RESET}"
}

bruteDir(){
    echo "${GREEN}\n--==[ Bruteforcing directories ]==--${RESET}"
    runBanner "dirsearch"#!/bin/bash

VERSION="1.0"

TARGET=$1

WORKING_DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
TOOLS_PATH="$WORKING_DIR/tools"
WORDLIST_PATH="$WORKING_DIR/wordlists"
RESULTS_PATH="$WORKING_DIR/hunting/$TARGET"
SUB_PATH="$RESULTS_PATH/subdomain"
CORS_PATH="$RESULTS_PATH/cors"
IP_PATH="$RESULTS_PATH/ip"
PSCAN_PATH="$RESULTS_PATH/portscan"
SSHOT_PATH="$RESULTS_PATH/screenshot"
DIR_PATH="$RESULTS_PATH/directory"
WAYBACKMACHINE="$WORKING_DIR/hunting/$TARGET/waybackmachine"

RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

displayLogo(){
echo "
██████╗ ███████╗ ██████╗ ██████╗ ███╗   ██╗
██╔══██╗██╔════╝██╔════╝██╔═══██╗████╗  ██║
██████╔╝█████╗  ██║     ██║   ██║██╔██╗ ██║
██╔══██╗██╔══╝  ██║     ██║   ██║██║╚██╗██║
██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚████║
╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══  
${RED}v$VERSION${RESET} by ${YELLOW}@JandersonCampelo${RESET}
"
}

checkArgs(){
    if [ $# -eq 0 ]; then
        echo "${RED}[+] Usage:${RESET} $0 <domain>\n"
        exit 1
    fi
}

runBanner(){
    name=$1
    echo "${RED}\n[+] Running $name...${RESET}"
}

setupDir(){
    echo "${GREEN}--==[ Setting things up ]==--${RESET}"
    echo "${RED}\n[+] Creating results directories...${RESET}"
    rm -rf $RESULTS_PATH
    mkdir -p $SUB_PATH $CORS_PATH $IP_PATH $PSCAN_PATH $SSHOT_PATH $DIR_PATH
    echo "${BLUE}[*] $SUB_PATH${RESET}"
    echo "${BLUE}[*] $CORS_PATH${RESET}"
    echo "${BLUE}[*] $IP_PATH${RESET}"
    echo "${BLUE}[*] $PSCAN_PATH${RESET}"
    echo "${BLUE}[*] $SSHOT_PATH${RESET}"
    echo "${BLUE}[*] $DIR_PATH${RESET}"
    #echo "${BLUE}[*] $WAYBACKMACHINE${RESET}"
}

enumSubs(){
    echo "${GREEN}\n--==[ Enumerating subdomains ]==--${RESET}"
    runBanner "Amass"
    amass enum -d $TARGET -o "$SUB_PATH"/amass.txt
    #amass enum -norecursive -noalts -d $TARGET > "$SUB_PATH"/amass.txt

    runBanner "subfinder"
    #subfinder -d $TARGET -v -t 50 -nW -o "$SUBS"/subfinder.txt -rL "$IPS/"resolvers.txt
    subfinder -d $TARGET -v -t 50 -nW -o "$SUBS"/subfinder.txt

    echo "${RED}\n[+] Combining subdomains...${RESET}"
    cat $SUB_PATH/*.txt | sort | awk '{print tolower($0)}' | uniq > $SUB_PATH/final-subdomains.txt
    echo "${BLUE}[*] Check the list of subdomains at $SUB_PATH/final-subdomains.txt${RESET}"

    echo "${GREEN}\n--==[ Checking for alives subdomains ]==--${RESET}"
    cat $SUB_PATH/final-subdomains.txt | httprobe | tee $SUB_PATH/final-hosts.txt
    echo "${BLUE}[*] Check HTTPROBE result at $SUB_PATH/final-hosts.txt${RESET}"

    echo "${GREEN}\n--==[ Checking for subdomain takeovers ]==--${RESET}"
    runBanner "subjack"
    subjack -a -ssl -t 50 -v -c ~/go/src/github.com/haccer/subjack/fingerprints.json -w $SUB_PATH/final-subdomains.txt -o $SUB_PATH/final-takeover.tmp
    #subjack    -ssl -t 100  -c ~/go/src/github.com/haccer/subjack/fingerprints.json -w $SUB_PATH/final-subdomains.txt -timeout 30  -v 3
    cat $SUB_PATH/final-takeover.tmp | grep -v "Not Vulnerable" > $SUB_PATH/final-takeover.txt
    rm $SUB_PATH/final-takeover.tmp
    echo "${BLUE}[*] Check subjack's result at $SUB_PATH/final-takeover.txt${RESET}"
}

hostalive(){
    echo "${GREEN}\n--==[ Probing for live hosts... ]==--${RESET}"
    runBanner "HTTProbe"
    cat $SUB_PATH/final-subdomains.txt | sort -u | httprobe -c 50 -t 3000 >> $SUB_PATH/responsive.txt
    cat $SUB_PATH/responsive.txt | sed 's/\http\:\/\///g' |  sed 's/\https\:\/\///g' | sort -u | while read line; do
    probeurl=$(cat $SUB_PATH/responsive.txt | sort -u | grep -m 1 $line)
    echo "$probeurl" >> $SUB_PATH/urllist.txt
    done
    echo "$(cat $SUB_PATH/urllist.txt | sort -u)" > $SUB_PATH/urllist.txt
    echo "${BLUE}[*] Total of $(wc -l $SUB_PATH/urllist.txt | awk '{print $1}') live subdomains were found${reset}"
}

corsScan(){
    echo "${GREEN}\n--==[ Checking CORS configuration ]==--${RESET}"
    runBanner "CORScanner"
    python3 $TOOLS_PATH/CORScanner/cors_scan.py -v -t 50 -i $SUB_PATH/final-subdomains.txt | tee $CORS_PATH/CORScaner-results.txt
    python3 $TOOLS_PATH/Corsy/corsy.py -i /$SUB_PATH/final-hosts.txt -t 20 -d 2 | tee $CORS_PATH/corsy-result.txt
    echo "${BLUE}[*] Check the result at $CORS_PATH/${RESET}"
}

visualRecon(){
    echo "${GREEN}\n--==[ Taking screenshots ]==--${RESET}"
    runBanner "aquatone"
    cat $SUB_PATH/final-subdomains.txt | aquatone -http-timeout 10000 -scan-timeout 300 -ports xlarge -out $SSHOT_PATH/aquatone/
    echo "${BLUE}[*] Check the result at $SSHOT_PATH/aquatone/aquatone_report.html${RESET}"
}

enumIPs(){
    echo "${GREEN}\n--==[ Resolving IP addresses ]==--${RESET}"
    runBanner "massdns"
    $TOOLS_PATH/massdns/bin/massdns -r $TOOLS_PATH/massdns/lists/resolvers.txt -q -t A -o S -w $IP_PATH/massdns.raw $SUB_PATH/final-subdomains.txt
    cat $IP_PATH/massdns.raw | grep -e ' A ' |  cut -d 'A' -f 2 | tr -d ' ' > $IP_PATH/massdns.txt
    cat $IP_PATH/*.txt | sort -V | uniq > $IP_PATH/final-ips.txt
    #sed 's/A.*//' livehosts.txt | sed 's/CN.*//' | sed 's/\..$//' > live_subdomains.txt ### Faz o inverso da linha acima, deixa apenas os subdomínios online

    echo "${BLUE}[*] Check the list of IP addresses at $IP_PATH/final-ips.txt${RESET}"
}

waybackrecon() {
    #echo "${GREEN}\n--==[ Running WaybackRecon]==--${RESET}"
    #runBanner "waybackurls"
    cat $SUB_PATH/urllist.txt | waybackurls >> $WAYBACKMACHINE/waybackurls.txt

    cat $WAYBACKMACHINE/waybackurls.txt  | sort -u | unfurl --unique keys > $WAYBACKMACHINE/paramlist.txt

    cat $WAYBACKMACHINE/waybackurls.txt  | sort -u | grep -P "\w+\.js(\?|$)" | sort -u > jsurls.txt

    cat $WAYBACKMACHINE/waybackurls.txt  | sort -u | grep -P "\w+\.php(\?|$)" | sort -u > phpurls.txt

    cat $WAYBACKMACHINE/waybackurls.txt  | sort -u | grep -P "\w+\.aspx(\?|$)" | sort -u > aspxurls.txt

    cat $WAYBACKMACHINE/waybackurls.txt  | sort -u | grep -P "\w+\.jsp(\?|$)" | sort -u > jspurls.txt
}


portScan(){
    echo "${GREEN}\n--==[ Port-scanning targets ]==--${RESET}"
    runBanner "masscan"
    sudo masscan -p 1-65535 --rate 10000 --wait 0 --open -iL $IP_PATH/final-ips.txt -oX $PSCAN_PATH/masscan.xml
    xsltproc -o $PSCAN_PATH/final-masscan.html $TOOLS_PATH/nmap-bootstrap.xsl $PSCAN_PATH/masscan.xml
    open_ports=$(cat $PSCAN_PATH/masscan.xml | grep portid | cut -d "\"" -f 10 | sort -n | uniq | paste -sd,)
    echo "${BLUE}[*] Masscan Done! View the HTML report at $PSCAN_PATH/final-masscan.html${RESET}"

    runBanner "nmap"
    sudo nmap -sVC -p $open_ports --open -v -T4 -Pn -iL $SUB_PATH/final-subdomains.txt -oX $PSCAN_PATH/nmap.xml
    xsltproc -o $PSCAN_PATH/final-nmap.html $PSCAN_PATH/nmap.xml
    echo "${BLUE}[*] Nmap Done! View the HTML report at $PSCAN_PATH/final-nmap.html${RESET}"
}

bruteDir(){
    echo "${GREEN}\n--==[ Bruteforcing directories ]==--${RESET}"
    runBanner "dirsearch"
    echo "${BLUE}[*]Creating output directory...${RESET}"
    mkdir -p $DIR_PATH/dirsearch
    for url in $(cat $SSHOT_PATH/aquatone/aquatone_urls.txt); do
        fqdn=$(echo $url | sed -e 's;https\?://;;' | sed -e 's;/.*$;;')
        $TOOLS_PATH/dirsearch/dirsearch.py -b -t 100 -e php,asp,aspx,jsp,html,zip,jar,sql -x 500,503 -r -w $WORDLIST_PATH/raft-large-words.txt -u $url --plain-text-report=$DIR_PATH/dirsearch/$fqdn.tmp
        if [ ! -s $DIR_PATH/dirsearch/$fqdn.tmp ]; then
            rm $DIR_PATH/dirsearch/$fqdn.tmp
        else
            cat $DIR_PATH/dirsearch/$fqdn.tmp | sort -k 1 -n > $DIR_PATH/dirsearch/$fqdn.txt
            rm $DIR_PATH/dirsearch/$fqdn.tmp
        fi
    done
    echo "${BLUE}[*] Check the results at $DIR_PATH/dirsearch/${RESET}"
}

# Main function
displayLogo
checkArgs $TARGET
setupDir
enumSubs
#hostalive
#corsScan
#visualRecon
#waybackrecon
#enumIPs
#portScan
#bruteDir

echo "${GREEN}\n--==[ DONE ]==--${RESET}"
    echo "${BLUE}[*] Check the results at $DIR_PATH/dirsearch/${RESET}"
}

# Main function
displayLogo
checkArgs $TARGET
setupDir
enumSubs
#hostalive
#corsScan
#visualRecon
#waybackrecon
#enumIPs
#portScan
#bruteDir

echo "${GREEN}\n--==[ DONE ]==--${RESET}"