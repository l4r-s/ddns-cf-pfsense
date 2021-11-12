# ddns-cf-shell
DDNS shell script for pfsense or opnsene and cloudflare.

This script will get the current wan IP address (from vtnet0) and updates the cloudflare dns over api.

## How to use
1. Place the script somewhere on your pfsense
2. Greate your desired record with the cloudflare dashboard and set the content to 127.0.0.1
3. Execute the following snippet (change stuff in [])

    ~~~~bash
    curl -X GET "https://api.cloudflare.com/client/v4/zones/[ZONEID]/dns_records?type=A&name=[recordname]&content=127.0.0.1&page=1&per_page=20&order=type&direction=desc&match=all" \
    -H "Authorization: Bearer [API token with DNS zone edit permission]" \
    -H "Content-Type: application/json"

    ## Example:
    curl -X GET
    "https://api.cloudflare.com/client/v4/zones/324r5431b34e321ed32ddewdwe3a533148d/dns_records?type=A&name=ddns.example.com&content=127.0.0.1&page=1&per_page=20&order=type&direction=desc&match=all"
       -H "X-Auth-Email: joe@example.com" \
       -H "X-Auth-Key: ddeee3333333333rtrni3" \
       -H "Content-Type: application/json"
      ~~~~

4. Set the following variables in the script:

  ~~~~bash
  USERNAME="your Cloudflare Username"
  APIKEY="your Cldoudflare API key (from the dashboard)"
  ZONEID="your Cloudflare Zone ID (from the dashboard)"
  RECORDID="Cloudflare Record ID (from the snippet above)"
  ~~~~
