# InfosecBookmarks

> Organizando os bookmarks que acumulei no Chrome

- [Bug Bounty](#bug-bounty)
    - [Recon](#recon)
    - [Tools](#tools)
    - [Awesome Lists](#awesome-lists)
- [Bugs](#bugs)
    - [Finding Subdomain Takeover](#finding-subdomain-takeover)
    - [Finding Race Conditions](#finding-race-conditions)
    - [Finding XXE](#finding-xxe)
    - [Finding XSS](#finding-xss)
- [Mobile](#mobile)
    - [Tools](#mobile-tools)
    - [CheatSheet](#mobile-cheatsheet)
- [API Test](#api-test)
- [Labs](#labs)
- [WriteUps](#writeups)
    - [Subdomain Takeover Writeups](#subdomain-takeover-writeups)
    - [HTTP Request Smuggling Writeups](#http-request-smuggling-writeups)
    - [XSS Writeups](#xss-writeups)
    - [SSRF Writeups](#ssrf-writeups)
    - [XXE Writeups](#xxe-writeups)
- [Pentesting](#pentesting)
- [Forensics](#forensics)
- [Reverse Engineering](#reverse-engineering)
- [Certifications](#Certifications)

---

## Bug Bounty
- [ ] [OWASP Web Security Testing Guide](https://github.com/OWASP/wstg)
- [X] [**Bug Bounty Methodology](https://github.com/0xhelloworld/public/wiki/Bug-Bounty-Methodology)
- [X] [**Bug Hunting Methodology (part-1)Updated on 4-Jan-2020](https://blog.usejournal.com/bug-hunting-methodology-part-1-91295b2d2066)
- [X] [**Bug Hunting Methodology(Part-2)](https://blog.usejournal.com/bug-hunting-methodology-part-2-5579dac06150)
- [ ] [GETTING STARTED – BUG BOUNTY HUNTER METHODOLOGY](https://www.bugcrowd.com/blog/getting-started-bug-bounty-hunter-methodology/)
- [ ] [Bug Bounty Methodology (Methodology, Toolkit, Tips & Tricks, Blogs) V 1.0 | By Sanyam Chawla](https://eforensicsmag.com/bug-bounty-methodology-methodology-toolkit-tips-tricks-blogs-v-1-0-by-sanyam-chawla/)
- [ ] [Bug Bounty Methodology (TTP- Tactics,Techniques and Procedures) V 2.0 | By Sanyam Chawla](https://eforensicsmag.com/bug-bounty-methodology-ttp-tacticstechniques-and-procedures-v-2-0/)
- [ ] [Resources-for-Beginner-Bug-Bounty-Hunters](https://github.com/nahamsec/Resources-for-Beginner-Bug-Bounty-Hunters)
- [ ] [The Bug Hunters Methodology](https://github.com/jhaddix/tbhm)
- [ ] [Penetration Testing Methodology](https://github.com/DeborahN/Penetration-Testing-Methodology)
- [ ] [Bug Bounty Hunter Methodology v3](https://docs.google.com/presentation/d/1R-3eqlt31sL7_rj2f1_vGEqqb7hcx4vxX_L7E23lJVo/edit#slide=id.p)
- [ ] [It's the Little Things II](https://docs.google.com/presentation/d/1xgvEScGZ_ukNY0rmfKz1JN0sn-CgZY_rTp2B_SZvijk/edit#slide=id.g4052c4692d_0_0)
- [ ] [Web Application Security & Bug Bounty (Methodology, Reconnaissance, Vulnerabilities, Reporting)](https://blog.usejournal.com/web-application-security-bug-bounty-methodology-reconnaissance-vulnerabilities-reporting-635073cddcf2)
- [ ] [Guide 001 |Getting Started in Bug Bounty Hunting..](https://whoami.securitybreached.org/2019/06/03/guide-getting-started-in-bug-bounty-hunting/)
- [ ] [Researcher Resources - How to become a Bug Bounty Hunter](https://forum.bugcrowd.com/t/researcher-resources-how-to-become-a-bug-bounty-hunter/1102)
- [ ] [Bug Bounty Guide](https://bugbountyguide.com/)
- [ ] [Bug Bounty Checklist for Web App](https://github.com/sehno/Bug-bounty/blob/master/bugbounty_checklist.md )
- [ ] [The Web Application Hacker's Handbook](https://gist.github.com/gbedoya/10935137)
- [X] [**Two easy ways to get a list of scopes from a hackerone](https://www.hahwul.com/2019/12/two-easy-ways-to-get-list-of-scopes-from-hackerone.html)
- [ ] [DanielMiessler - ](https://danielmiessler.com/study/)
- [ ] [Legion - open source network penetration testing tool](https://hakin9.org/legion-open-source-network-penetration-testing-tool/)
- [ ] [HTTP headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers)
- [ ] [ProTips: Bug Bounty Hunting with Random Robbie](https://securitytrails.com/blog/bug-bounty-hunting?from=relatedposts)
- [ ] [Content Security Policy (CSP) Bypasses](http://ghostlulz.com/content-security-policy-csp-bypasses/)
- [ ] [Book of Bug Bounty Tips](https://gowsundar.gitbook.io/book-of-bugbounty-tips/)
- [ ] [Bug Bounty catches part -1](https://pwnsec.ninja/2020/03/04/bug-bounty-catches-part-1/)
- [X] [**Bug Bounty Hunting Tips #3 — Kicking S3 Buckets**](https://craighays.com/bug-bounty-hunting-tips-3-kicking-s3-buckets/)

### RECON
- [ ] [Subdomain Enumeration: 2019 Workflow](https://0xpatrik.com/subdomain-enumeration-2019/)
- [ ] [[Tools] Visual Recon – A beginners guide](https://blog.it-securityguard.com/visual-recon-a-beginners-guide/)
- [X] [**AQUATONE: A tool for domain flyovers](https://michenriksen.com/blog/aquatone-tool-for-domain-flyovers/)
- [X] [**AQUATONE: Now in Go](https://michenriksen.com/blog/aquatone-now-in-go/)
- [ ] [DISCOVERING SUBDOMAINS](https://www.bugcrowd.com/blog/discovering-subdomains/)
- [ ] [https://appsecco.com/books/subdomain-enumeration/](https://appsecco.com/books/subdomain-enumeration/)
- [ ] [HOW TO: RECON AND CONTENT DISCOVERY](https://www.hackerone.com/blog/how-to-recon-and-content-discovery)
- [ ] [HTTPRecon (Server Fingerprint)](https://w3dt.net/tools/httprecon)
- [ ] [GitHub Gist Recon](https://secapps.com/tutorials/github-gist-recon/)
- [ ] [GitHub tools collection](http://10degres.net/github-tools-collection/)
- [ ] [A More Advanced Recon Automation #1 (Subdomains)](https://poc-server.com/blog/2019/01/18/advanced-recon-subdomains/)
- [ ] [Advanced Recon Automation (Subdomains) case 1](https://anhtai.me/advanced-recon-automation-subdomains-case-1/)
- [ ] [Masscan Examples: From Installation to Everyday Use](https://danielmiessler.com/study/masscan/)
- [ ] [Open Source Intelligence Gathering 101](https://blog.appsecco.com/open-source-intelligence-gathering-101-d2861d4429e3)
- [ ] [Commonspeak: Content discovery wordlists built with BigQuery](https://pentester.io/commonspeak-bigquery-wordlists/)
- [ ] [Recon-ng Tutorial – Part 1 Install and Setup](http://securenetworkmanagement.com/recon-ng-tutorial-part-1/)
- [ ] [Recon-ng Tutorial – Part 2 Workspaces and Import](http://securenetworkmanagement.com/recon-ng-tutorial-part-2/)
- [ ] [Recon-ng Tutorial – Part 3 Usage and Reporting](http://securenetworkmanagement.com/recon-ng-tutorial-part-3/)
- [ ] [Wfuzz: The Web fuzzer](https://wfuzz.readthedocs.io/en/latest/)
- [ ] [WFUZZ BRUTEFORCING WEB APPLICATIONS](https://hydrasky.com/network-security/wfuzz-bruteforcing-web-applications/)
- [ ] [10 nmap Commands Every Sysadmin Should Know](http://bencane.com/2013/02/25/10-nmap-commands-every-sysadmin-should-know/)
- [ ] [5 Nmap Timing Templates – You should know](https://www.cyberpratibha.com/blog/using-timing-templates-in-nmap/)
- [ ] [Gobuster Cheatsheet](https://redteamtutorials.com/2018/11/19/gobuster-cheatsheet/)
- [ ] [Comprehensive Guide on Gobuster Tool](https://www.hackingarticles.in/comprehensive-guide-on-gobuster-tool/)
- [ ] [Comprehensive Guide on Dirb Tool](https://www.hackingarticles.in/comprehensive-guide-on-dirb-tool/)
- [ ] [amass — Automated Attack Surface Mapping](https://danielmiessler.com/study/amass/)
- [ ] [Auto Web Application Penetration Testing: Intelligence Gathering](https://securityonline.info/auto-web-application-penetration-testing/)
- [ ] [Subdomain enumeration](http://10degres.net/subdomain-enumeration/)
- [ ] [How to Find Directories in Websites Using DirBuster](https://null-byte.wonderhowto.com/how-to/hack-like-pro-find-directories-websites-using-dirbuster-0157593/)
- [ ] [Web Reconnaissance Framework: Recon-ng](https://n0where.net/web-reconnaissance-framework-recon-ng)
- [ ] [Automating your reconnaissance workflow with 'meg'](https://edoverflow.com/2018/meg/)
- [ ] [Subdomain Discovery - Bugcrwod Blog](https://forum.bugcrowd.com/t/subdomain-discovery/)
- [X] [**WAFW00F - The Web Application Firewall Fingerprinting Tool](https://hakin9.org/wafw00f-the-web-application-firewall-fingerprinting-tool/)
- [X] [**ASN Lookup Tools, Strategies and Techniques](https://securitytrails.com/blog/asn-lookup)
- [ ] [A penetration tester’s guide to subdomain enumeration](https://blog.appsecco.com/a-penetration-testers-guide-to-sub-domain-enumeration-7d842d5570f6)
- [ ] [rebootuser - Tag Archives: enumeration](https://www.rebootuser.com/?tag=enumeration)
- [ ] [Subdomains Enumeration Cheat Sheet](https://pentester.land/cheatsheets/2018/11/14/subdomains-enumeration-cheatsheet.html)
- [ ] [Asset Discovery: Doing Reconnaissance the Hard Way](https://0xpatrik.com/asset-discovery/)
- [ ] [A Shodan Tutorial and Primer](https://danielmiessler.com/study/shodan/)
### Tools

**My Box**
- [X] [ASSETFINDER](https://github.com/tomnomnom/assetfinder)
- [X] [Aquatone](https://github.com/michenriksen/aquatone)
- [X] [Amass](https://github.com/OWASP/Amass)
- [ ] [ASN Lookup](https://github.com/yassineaboukir/Asnlookup)
- [ ] [FFUF](https://github.com/ffuf/ffuf)
- [X] [Sublert](https://github.com/yassineaboukir/sublert)
- [X] [Findomain](https://github.com/Edu4rdSHL/findomain)
- [X] [Subfinder](https://github.com/projectdiscovery/subfinder)
- [X] [MassDNS](https://github.com/blechschmidt/massdns)
- [ ] [AltDNS](https://github.com/infosec-au/altdns)
- [ ] [Masscan](https://github.com/robertdavidgraham/masscan)
- [X] [AltDNS](https://github.com/infosec-au/altdns)
- [X] [NMap](https://nmap.org/book/install.html)
- [X] [WhatWeb](https://github.com/urbanadventurer/WhatWeb)
- [X] [HTTPROBE](https://github.com/tomnomnom/httprobe)
- [ ] [Corsy](https://github.com/s0md3v/Corsy)
- [ ] [CORStest](https://github.com/RUB-NDS/CORStest)
- [X] [CORScanner](https://github.com/chenjj/CORScanner)
- [X] [WAFW00F](https://github.com/EnableSecurity/wafw00f)
- [X] [Knock](https://github.com/guelfoweb/knock)
- [X] [WAFW00F](https://github.com/EnableSecurity/wafw00f)
- [X] [SubJack](https://github.com/haccer/subjack)
- [ ] [SubOVer](https://github.com/Ice3man543/SubOver)
- [ ] [DirSearch](https://github.com/maurosoria/dirsearch)
- [ ] [GoBuster](https://github.com/OJ/gobuster)

**Others**
- [ ] [AutoRecon](https://github.com/JoshuaMart/AutoRecon)
- [ ] [Sn1per](https://github.com/1N3/Sn1per)
- [X] [Lazy Recon](https://github.com/capt-meelo/LazyRecon)
- [ ] [Rock-ON (A One-Shoot Killer)](https://github.com/SilverPoision/Rock-ON)
- [ ] [Final Recon](https://github.com/thewhiteh4t/FinalRecon)
- [ ] [TotalRecon](https://github.com/vitalysim/totalrecon)
- [ ] [RED HAWK](https://github.com/Tuhinshubhra/RED_HAWK)
- [ ] [recon.sh](https://github.com/jobertabma/recon.sh)
---
- [ ] [Sudomy](https://github.com/Screetsec/Sudomy)
- [ ] [VHostScan](https://github.com/codingo/VHostScan)
- [ ] [WFuzz](https://github.com/xmendez/wfuzz)
- [ ] [DirSearch](https://github.com/evilsocket/dirsearch)
- [ ] [MEG](https://github.com/tomnomnom/meg)
- [ ] [GitRob](https://github.com/michenriksen/gitrob)
- [ ] [GitGot](https://github.com/BishopFox/GitGot)
- [ ] [GitLeaks](https://github.com/zricethezav/gitleaks)
- [ ] [Git Grabber](https://github.com/mattrafalko/gitGrabber)
- [ ] [ReconNG](https://github.com/lanmaster53/recon-ng)
- [ ] [truffleHog](https://github.com/dxa4481/truffleHog)
- [ ] [Jaeles](https://github.com/jaeles-project/jaeles)
- [ ] [Notable](https://github.com/notable/notable)
- [X] [danielmiessler/SecLists](https://github.com/danielmiessler/SecLists)
- [X] [WordList-Compendium](https://github.com/Dormidera/WordList-Compendium)

### Awesome Lists
- [Awesome Bug Bounty](https://github.com/djadmin/awesome-bug-bounty)

## Bugs

### Finding Subdomain Takeover
- [ ] [A GUIDE TO SUBDOMAIN TAKEOVERS](https://www.hackerone.com/blog/Guide-Subdomain-Takeovers)
- [ ] [Subdomain takeover - Chapter one: Methodology](https://blog.cystack.net/subdomain-takeover/)
- [ ] [Subdomain takeover - Chapter two: Azure Services](https://blog.cystack.net/subdomain-takeover-chapter-two-azure-services/)
- [ ] [Find Subdomain Takeover with Amass + SubJack](https://www.hahwul.com/2019/10/find-subdomain-takeover-with-amass-and-subjack.html)
- [ ] [5 Subdomain Takeover #ProTips](https://securitytrails.com/blog/subdomain-takeover-tips)
- [ ] [Subdomain Takeover](https://enciphers.com/subdomain-takeover/)
- [ ] [Subdomain takeover via pantheon](https://smaranchand.com.np/2019/12/subdomain-takeover-via-pantheon/)
- [ ] [Subdomain takeover detection with AQUATONE](https://michenriksen.com/blog/subdomain-takeover-detection-with-aquatone/)
- [ ] [Subdomain Takeover: Basics](https://0xpatrik.com/subdomain-takeover-basics/)
- [ ] [Subdomain Takeover: Finding Candidates](https://0xpatrik.com/subdomain-takeover-candidates/)
- [ ] [Can I take over XYZ?](https://github.com/EdOverflow/can-i-take-over-xyz)
#### tools

### Finding Race Conditions
- [ ] [Testing for Race Conditions (OWASP-AT-010)](https://www.owasp.org/index.php/Testing_for_Race_Conditions_(OWASP-AT-010))
#### tools
- [ ] [Race The Web (RTW)](https://github.com/aaronhnatiw/race-the-web)

### Finding XXE
- [ ] [OWASP - XML External Entity (XXE) Processing](https://www.owasp.org/index.php/XML_External_Entity_(XXE)_Processing)
- [ ] [XXE - THINGS ARE GETTING OUT OF BAND](https://blog.zsec.uk/out-of-band-xxe-2/)
- [ ] [OWASP TOP 10: XXE](https://blog.detectify.com/2018/04/17/owasp-top-10-xxe/)
- [ ] [Out-of-band XML External Entity (OOB-XXE)](https://www.acunetix.com/blog/articles/band-xml-external-entity-oob-xxe/)
- [ ] [What Are XML External Entity (XXE) Attacks](https://www.acunetix.com/blog/articles/xml-external-entity-xxe-vulnerabilities/)
- [ ] [Hunting for XXE in Uber using Acunetix AcuMonitor](https://www.acunetix.com/blog/articles/hunting-xxe-uber-using-acunetix-acumonitor/)
- [ ] [XXE - XML External Entity](https://chris-young.net/2018/04/13/xxe-xml-external-entity/)
- [ ] [A Deep Dive into XXE Injection](https://www.synack.com/blog/a-deep-dive-into-xxe-injection/)
- [ ] [ADVICE FROM A RESEARCHER: HUNTING XXE FOR FUN AND PROFIT](https://www.bugcrowd.com/blog/advice-from-a-bug-hunter-xxe/)
- [ ] [XML External Entity(XXE)](http://ghostlulz.com/xml-external-entityxxe/)
- [ ] [SPILLING LOCAL FILES VIA XXE WHEN HTTP OOB FAILS](https://www.noob.ninja/2019/12/spilling-local-files-via-xxe-when-http.html)
- [ ] [Vilnerability 1: XXE in community.{site}.com](https://esoln.net/blog/2019/03/05/xxe-in-community-site-com/)
- [ ] [xxe-that-can-bypass-waf-protection](https://lab.wallarm.com/xxe-that-can-bypass-waf-protection-98f679452ce0/)
- [ ] [External XML Entity via File Upload (SVG)](https://0xatul.github.io/posts/2020/02/external-xml-entity-via-file-upload-svg/)

#### tools
- [ ] [XML External Entity (XXE) Injection Payload List](https://github.com/payloadbox/xxe-injection-payload-list)
- [ ] [B-XSSRF](https://github.com/SpiderMate/B-XSSRF)
- [ ] [xxe-recursive-download](https://github.com/AonCyberLabs/xxe-recursive-download)
- [ ] [XML External Entity Injection](https://github.com/rhamaa/Web-Application-Attack/blob/master/other-vulnerability/xxe-injection.md)
- [ ] [PayloadsAllTheThings - XML External Entity](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/XXE%20Injection)
- [ ] [Blind XXE Payload Generator](https://github.com/discodamone/XXE-Generator)

### Finding XSS
- [ ] [Actual XSS in 2020](https://netsec.expert/2020/02/01/xss-in-2020.html)
- [ ] [Finding and Fixing Cross-site Scripting (XSS)](https://www.akimbocore.com/finding-and-fixing-cross-site-scripting-xss/)
- [ ] [XSS on Cookie Pop-up](https://0x00sec.org/t/xss-on-cookie-pop-up/19580)
#### tools

## Mobile
- [ ] [HOW2HACK - GET STARTED HACKING MOBILE](https://www.hackerone.com/blog/How-to-Hack-Get-Started-Hacking-Mobile)
- [ ] [OWASP Mobile Security Testing Guide](https://github.com/OWASP/owasp-mstg/)
- [ ] [OWASP Mobile Security Testing Guide - GitBook](https://mobile-security.gitbook.io/mobile-security-testing-guide/)
- [ ] [BUG BOUNTY & ANDROID APPLICATIONS - PART 1](https://x1m.nl/posts/android-app-testing-part-1/)
- [ ] [Introducing Web Vulnerabilities into Native Apps](https://blog.compass-security.com/2019/10/introducing-web-vulnerabilities-into-native-apps)
- [ ] [Tips for Mobile Bug Bounty Hunting](https://ivrodriguez.com/tips-for-mobile-bug-bounty-hunting/)
- [ ] [MOBILE APPLICATION PENETRATION TESTING METHODOLOGY](https://hacken.io/research/education/mobile-application-penetration-testing-methodology/)
- [ ] [Configuring Frida with BurpSuite and Genymotion to bypass Android SSL Pinning](https://spenkk.github.io/bugbounty/Configuring-Frida-with-Burp-and-GenyMotion-to-bypass-SSL-Pinning/)
- [ ] [awesome-mobile-security](https://github.com/vaib25vicky/awesome-mobile-security)
- [ ] [Android App Reverse Engineering 101](https://maddiestone.github.io/AndroidAppRE/)
### Mobile Tools
- [FRIDA.RE](https://frida.re/docs/home/)
- [Mobile Security Framework (MobSF)](https://github.com/MobSF/Mobile-Security-Framework-MobSF)

### Mobile CheatSheet
- [Mobile Application Penetration Testing Cheat Sheet](https://github.com/tanprathan/MobileApp-Pentest-Cheatsheet)
- [android-security-awesome](https://github.com/ashishb/android-security-awesome)

## API Test
### API Test
- [ ] [31-days-of-API-Security-Tips](https://github.com/smodnix/31-days-of-API-Security-Tips)
- [ ] [A Deep Dive On The Most Critical API Vulnerability — BOLA (Broken Object Level Authorization)](https://medium.com/@inonst/a-deep-dive-on-the-most-critical-api-vulnerability-bola-1342224ec3f2)
- [ ] [API Testing Tutorial: Learn in 10 minutes!](https://www.guru99.com/api-testing.html)

## Labs
- [Web Security Academy](https://portswigger.net/web-security)
- [CTF Hacker 101](https://ctf.hacker101.com/ctf)
- [PentesterLab](https://pentesterlab.com/)
- [OWASP Juice Shop](https://juice-shop.herokuapp.com/)
- [Lesser Known Web Attack Lab](https://github.com/weev3/LKWA)
- [XSS Game](https://xss.pwnfunction.com/)

## WriteUps

### Subdomain Takeover Writeups
- [ ] [Subdomain Takeover: Proof Creation for Bug Bounties](https://0xpatrik.com/takeover-proofs/)
- [ ] [Subdomain Takeover: Yet another Starbucks case](https://0xpatrik.com/subdomain-takeover-starbucks-ii/)
- [ ] [URGENT – Subdomain Takeover in support.urbandictionary.com pointing to Zendesk](https://bugbountytuts.wordpress.com/2017/04/20/subdomain-takeover/)
- [ ] [Subdomain Takeover in Velostrata - Google Acquisition](https://tutorgeeks.blogspot.com/2019/04/subdomain-takeover-in-velostrata-google.html)
- [ ] [Subdomain Takeover using blog.greenhouse.io pointing to Hubspot](https://bugbountytuts.wordpress.com/2017/04/21/subdomain-takeover-using-blog-greenhouse-io-pointing-to-hubspot/)
- [ ] [Shipt Subdomain TakeOver Via HeroKu ( Test.Shipt.Com )](https://www.mohamedharon.com/2018/08/Shipttakeover.html)

### HTTP Request Smuggling Writeups
- [ ] [HTTP Request Smuggling + IDOR](https://hipotermia.pw/bb/http-desync-idor)

### XSS Writeups
- [ ] [Reflected XSS in graph.facebook.com leads to account takeover in IE/Edge](https://ysamm.com/?p=343)
- [ ] [Arbitary File Upload too Stored XSS - Bug Bounty](https://m0chan.github.io/2020/02/04/Arbitary-File-Upload-Too-Stored-XSS.html)

### SSRF Writeups
- [ ] [AWS takeover through SSRF in JavaScript](http://10degres.net/aws-takeover-through-ssrf-in-javascript/)

### XXE

### IDOR
- [ ] [Facebook OAuth Framework Vulnerability](https://www.amolbaikar.com/facebook-oauth-framework-vulnerability/)

### RCE
- [ ] [Responsible Disclosure: Breaking out of a Sandboxed Editor to perform RCE](https://jatindhankhar.in/blog/responsible-disclosure-breaking-out-of-a-sandboxed-editor-to-perform-rce/)

### LFI
- [ ] [LOCAL FILE READ VIA XSS IN DYNAMICALLY GENERATED PDF](https://www.noob.ninja/2017/11/local-file-read-via-xss-in-dynamically.html)

### Misconfiguration
- [ ] [S3 Bucket Misconfiguration: From Basics to Pawn](https://bugbountypoc.com/s3-bucket-misconfiguration-from-basics-to-pawn/)

## Pentesting
- [ ] [METASPLOIT UNLEASHED](https://www.offensive-security.com/metasploit-unleashed/)
- [ ] [Beginner’s Guide to Nexpose](https://www.hackingarticles.in/beginners-guide-to-nexpose/)
- [ ] [A useful list of free tools to scan your website for security vulnerabilities](https://eforensicsmag.com/a-useful-list-of-free-tools-to-scan-your-website-for-security-vulnerabilities-by-erica-sunarjo/)
- [ ] [Python WiFi Scanner Coding [FREE COURSE CONTENT]](https://hakin9.org/python-wifi-scanner-coding-free-course-content/)

## Forensics

## Reverse Engineering

## Certifications
- [ ] [CISSP vs CEH? Which IT Security Certifications are More Valuable?](https://hakin9.org/cissp-vs-ceh/)
- [ ] [Try Harder! My Penetration Testing with Kali Linux OSCP Review and course/lab experience — My OSCP Review | by Jason Bernier](https://hakin9.org/try-harder-my-penetration-testing-with-kali-linux-oscp-review-and-courselab-experience-my-oscp-review-by-jason-bernier/)
- [ ] [MY OSCP GUIDE: A PHILOSOPHICAL APPROACH](https://www.offensive-security.com/offsec/my-philosophical-approach-to-oscp/)
- [ ] [OSCP-Prep](https://github.com/RustyShackleford221/OSCP-Prep)
- [ ] [The Journey to Try Harder: TJnull’s Preparation Guide for PWK/OSCP](https://www.netsecfocus.com/oscp/2019/03/29/The_Journey_to_Try_Harder-_TJNulls_Preparation_Guide_for_PWK_OSCP.html)
- [ ] [oscp like stack buffer overflow](https://github.com/r4j0x00/oscp-like-stack-buffer-overflow)
- [ ] [OSCP-Survival-Guide](https://github.com/wwong99/pentest-notes/blob/master/oscp_resources/OSCP-Survival-Guide.md)
- [ ] [OSCP Preparation – Stalking my Penetration Testing Passion](https://barasec.wordpress.com/2017/11/26/oscp-preparation-stalking-my-penetration-testing-passion/)
- [ ] [Offensive Security Bookmarks](https://jivoi.github.io/2015/07/03/offensive-security-bookmarks/)
