# ddns-cf-shell
DDNS shell script for pfsense and cloudflare.

## How to use
1. place the script somewhere on your pfsense
2. you need to have the record id of your DNS record, which one you want to update:
~~~~
curl -X GET "https://api.cloudflare.com/client/v4/zones/$ZONEID/dns_records?type=A&name=h.l4rs.net&content=85.195.232.88&page=1&per_page=20&order=type&dir    ection=desc&match=all" \
  -H "X-Auth-Email: $USERNAME" \
  -H "X-Auth-Key: $APIKEY" \
  -H "Content-Type: application/json"
~~~~
3. Set the following variables in the script:
~~~~
USERNAME="cf-username"
APIKEY="cf-api-token"
ZONEID="cf-zone-id"
RECORDID="cf-record-id"
~~~~
