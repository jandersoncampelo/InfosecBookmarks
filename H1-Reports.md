# H1 Reports

- [Subdomain Takeover](#subdomain-takeover)
- [Open Redirect](#open-redirect)
- [IDOR](#idor)
- [XXE](#xxe)
- [SSTI](#ssti)
- [SQL Injection](#sql-injection)
- [XSS](#xss)    
- [RCE](#rce)
- [SSRF](#ssrf)
- [CSRF](#csrf)
- [CRLF](#crlf)
- [Local File Include](#lfi)
- [Race Condition](#race-condition)
- [Leaking Information](#leaking-information)
- [More Bugs](#more-bugs)

## Subdomain Takeover
- [ ] [Bulgaria - Subdomain takeover of mail.starbucks.bg](https://hackerone.com/reports/736863)
- [ ] [Subdomain takeover of datacafe-cert.starbucks.com](https://hackerone.com/reports/665398)
- [ ] [Subdomain takeover on usclsapipma.cv.ford.com](https://hackerone.com/reports/484420)
- [ ] [Account takeover at https://try.discourse.org due to no CSRF protection in connecting Yahoo account](https://hackerone.com/reports/423022)
- [ ] [subdomain Takeover at blog.exchangemarketplace.com](https://hackerone.com/reports/416474)
- [ ] [Domain Takeover in [obviousengine.com] a snapchat acquisitions](https://hackerone.com/reports/392785)
- [ ] [Subdomain takeover on svcgatewaydevus.starbucks.com and svcgatewayloadus.starbucks.com](https://hackerone.com/reports/383564)
- [ ] [Subdomain takeover on wfmnarptpc.starbucks.com](https://hackerone.com/reports/388622)
- [ ] [Subdomain Takeover at test.shipt.com](https://hackerone.com/reports/387760)
- [ ] [svcardproxydevus.starbucks.com Subdomain take over](https://hackerone.com/reports/380158)
- [ ] [Subdomain takeover on svcgatewayus.starbucks.com](https://hackerone.com/reports/325336)
- [ ] [subdomain takeover at news-static.semrush.com](https://hackerone.com/reports/294201)
- [ ] [Account Takeover using Third party Auth CSRF](https://hackerone.com/reports/225653)
- [ ] [[ux.shopify.com] Subdomain takeover](https://hackerone.com/reports/221631)
- [ ] [Authentication bypass on auth.uber.com via subdomain takeover of saostatic.uber.com](https://hackerone.com/reports/219205)
- [ ] [Subdomain takeover #4 at info.hacker.one](https://hackerone.com/reports/220002)
- [ ] [Subdomain takeover #3 at info.hacker.one](https://hackerone.com/reports/217358)
- [ ] [Subdomain takeover #2 at info.hacker.one](https://hackerone.com/reports/209004)
- [ ] [Subdomain takeover at signup.uber.com](https://hackerone.com/reports/197489)
- [ ] [Subdomain takeover on podcasts.slack-core.com](https://hackerone.com/reports/195350)
- [ ] [Subdomain Takeover (moderator.ubnt.com)](https://hackerone.com/reports/181665)
- [ ] [Subdomain takeover on rider.uber.com due to non-existent distribution on Cloudfront](https://hackerone.com/reports/175070)
- [ ] [Subdomain takeover due to unclaimed Amazon S3 bucket on a2.bime.io](https://hackerone.com/reports/121461)
- [ ] [Subdomain takeover in http://support.scan.me pointing to Zendesk (a Snapchat acquisition)](https://hackerone.com/reports/114134)
- [ ] [URGENT - Subdomain Takeover on media.vine.co due to unclaimed domain pointing to AWS](https://hackerone.com/reports/32825)

## Open Redirect
- [ ] [Open Redirect](https://hackerone.com/reports/504751)

## IDOR
- [ ] [IDOR allow access to payments data of any user](https://hackerone.com/reports/751577)

## XXE
- [ ] [open redirect while login at https://apps.dev.jupiterone.io can leak access code.](https://hackerone.com/reports/591266)
- [ ] [XXE at ecjobs.starbucks.com.cn/retail/hxpublic_v6/hxdynamicpage6.aspx](https://hackerone.com/reports/500515)
- [ ] [Partial bypass of #483774 with Blind XXE on https://duckduckgo.com](https://hackerone.com/reports/486732)
- [ ] [XXE on ██████████ by bypassing WAF ████](https://hackerone.com/reports/433996)
- [ ] [Blind XXE via Powerpoint files](https://hackerone.com/reports/334488)
- [ ] [XXE on sms-be-vip.twitter.com in SXMP Processor](https://hackerone.com/reports/248668)
- [ ] [Blind OOB XXE At "http://ubermovement.com/"](https://hackerone.com/reports/154096)

## SSTI

## SQL Injection

## XSS
- [ ] [Stored XSS | api.mapbox.com | IE 11 | Styles name](https://hackerone.com/reports/763812)
- [ ] [Stored XSS in Shopify Chat](https://hackerone.com/reports/756729)
- [ ] [Open redirect](https://hackerone.com/reports/753399)
- [ ] [Reflected XSS at https://pay.gold.razer.com escalated to account takeover](https://hackerone.com/reports/723060)
- [ ] [H1514 Stored XSS on Wholesale sales channel allows cross-organization data leakage](https://hackerone.com/reports/423454)
- [ ] [XSS in "explore-keywords-dropdown" results.](https://hackerone.com/reports/347567)
- [ ] [Xss was found by exploiting the URL markdown on http://store.steampowered.com](https://hackerone.com/reports/313250)
- [ ] [Stored XSS in www.learnboost.com via ZIP codes.](https://hackerone.com/reports/300812)
- [ ] [Stored XSS in *.myshopify.com](https://hackerone.com/reports/241008)
- [ ] [Stored XSS templates -> 'call for action' feature](https://hackerone.com/reports/237927)
- [ ] [[app.mixmax.com] Stored XSS on Adding new enhancement.](https://hackerone.com/reports/237100)
- [ ] [Reflected XSS in Zomato Mobile - category parameter](https://hackerone.com/reports/230119)
- [ ] [Stored XSS in comments on https://www.starbucks.co.uk/blog/*](https://hackerone.com/reports/218226)
- [ ] [Stored XSS in e.mail.ru (payload affect multiple users)](https://hackerone.com/reports/217007)
- [ ] [IE 11 Self-XSS on Jira Integration Preview Base Link](https://hackerone.com/reports/212721)
- [ ] [Stored XSS via Discussion Title and Send as Email attribute in [marketplace.informatica.com]](https://hackerone.com/reports/203912)
- [ ] [[nutty.ubnt.com] DOM Based XSS nuttyapp github-btn.html](https://hackerone.com/reports/200753)
- [ ] [[XSS/pay.qiwi.com] Pay SubDomain Hard-Use XSS](https://hackerone.com/reports/198251)
- [ ] [[IMP] - Blind XSS in the admin panel for reviewing comments](https://hackerone.com/reports/197337)
- [ ] [XSS on username when register to proffesional account](https://hackerone.com/reports/196989)
- [ ] [Stored XSS in blog comments through Shopify API](https://hackerone.com/reports/192210)
- [ ] [[careers.informatica.com] XSS on "isJTN"](https://hackerone.com/reports/190020)
- [ ] [Stored XSS in Adress Book (starbucks.com/account/profile)](https://hackerone.com/reports/186554)
- [ ] [XSS in my.shopify.com in widget](https://hackerone.com/reports/185826)
- [ ] [XSS in IE11 on portswigger.net via Flash](https://hackerone.com/reports/182160)
- [ ] [Reflected XSS on blockchain.info](https://hackerone.com/reports/179426)
- [ ] [Stored XSS in community.ubnt.com](https://hackerone.com/reports/179164)
- [ ] [DOM based reflected XSS in rockstargames.com/newswire/tags through cross domain ajax request](https://hackerone.com/reports/172843)
- [ ] [Stored XSS(Cross Site Scripting) In Slack App Name](https://hackerone.com/reports/159460)
- [ ] [csp bypass + xss](https://hackerone.com/reports/153666)
- [ ] [Reflected XSS on business-blog.zomato.com - Part I](https://hackerone.com/reports/137905)
- [ ] [Stored self-XSS at m.uber.com](https://hackerone.com/reports/134124)
- [ ] [Reflected Self-XSS in Slack](https://hackerone.com/reports/97683)
- [ ] [Reflected XSS in cart at hardware.shopify.com](https://hackerone.com/reports/95089)
- [ ] [Self-XSS in posts by formatting text as code](https://hackerone.com/reports/89505)
- [ ] [Multiple DOMXSS on Amplify Web Player](https://hackerone.com/reports/88719)

## RCE
- [ ] [RCE and Complete Server Takeover of http://www.█████.starbucks.com.sg/](https://hackerone.com/reports/502758)

## SSRF
- [ ] [[SSRF] PDF documentconverterws](https://hackerone.com/reports/361793)
- [ ] [SSRF protection bypass](https://hackerone.com/reports/736867)
## CSRF
- [ ] [Possible CSRF during external programs](https://hackerone.com/reports/174470)

## CRLF
- [ ] [CRLF injection](https://hackerone.com/reports/446271)
- [ ] [CRLF Injection in legacy url API (url.parse().hostname)](https://hackerone.com/reports/771596)

## LFI
- [ ] [Korea - LFI via path traversal at https://msr.istarbucks.co.kr:6443/appif/](https://hackerone.com/reports/780021)

## Race Condition
- [] [Race Condition allows to redeem multiple times gift cards which leads to free "money"](https://hackerone.com/reports/759247)
- [ ] [Race Condition leads to undeletable group member](https://hackerone.com/reports/604534)

## HTTP Smuggling
- [ ] [HTTP SMUGGLING EXPOSED HMAC/DOS](https://hackerone.com/reports/753939)
- [ ] [Mass account takeovers using HTTP Request Smuggling on https://slackb.com/ to steal session cookies](https://hackerone.com/reports/737140)

## Leaking Information
- [ ] [Disclose Any Store products, Files, Purchase Orders Via Email through Shopify Stocky APP](https://hackerone.com/reports/763994)
- [ ] [Password reset token leakage via referer](https://hackerone.com/reports/342693)
- [ ] [[www.coursera.org] Leaking password reset link on referrer header](https://hackerone.com/reports/303322)
- [ ] [Password reset token leak on third party website via Referer header](https://hackerone.com/reports/272379)
- [ ] [password reset token leaking allowed for ATO of an Uber account](https://hackerone.com/reports/173551)

## GraphQL
- [ ] [Disabled account can still use GraphQL endpoint](https://hackerone.com/reports/608656)

## More Bugs
- [ ] [Unauthenticated users can obtain information about Checklist objects with unclaimed ChecklistCheck objects](https://hackerone.com/reports/781175)
- [ ] [Account takeover via leaked session cookie](https://hackerone.com/reports/745324)
- [ ] [JumpCloud API Key leaked via Open Github Repository.](https://hackerone.com/reports/716292)
- [ ] [Misconfigured s3 Bucket exposure](https://hackerone.com/reports/700051)
- [ ] [Http response is not ended although underlying socket is already destroyed](https://hackerone.com/reports/676710)
- [ ] [Arbitrary File Write as SYSTEM from unprivileged user](https://hackerone.com/reports/583184)
- [ ] [Two heap use-after-free errors in IMAP operations](https://hackerone.com/reports/546644)
- [ ] [Arbitrary file read via ffmpeg HLS parser at https://www.flickr.com/photos/upload](https://hackerone.com/reports/487008)
- [ ] [CORS Misconfiguration leading to Private Information Disclosure](https://hackerone.com/reports/430249)
- [ ] [[www.zomato.com] CORS Misconfiguration, could lead to disclosure of sensitive information](https://hackerone.com/reports/426165)
- [ ] [H1514 Ability to MiTM Shopify PoS Session to Takeover Communications](https://hackerone.com/reports/423467)
- [ ] [Http request splitting](https://hackerone.com/reports/409943)
- [ ] [Referer in /servlet/TestServlet](https://hackerone.com/reports/342976)
- [ ] [Change any Uber user's password through /rt/users/passwordless-signup - Account Takeover (critical)](https://hackerone.com/reports/143717)