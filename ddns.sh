#!/bin/sh
# pfsense ddns to cloudflare script

USERNAME="cf-username"
APIKEY="cf-api-token"
ZONEID="cf-zone-id"
RECORDID="cf-record-id"

IP=`ifconfig vtnet0 | grep "inet " | awk '{ print $2 }'`

DATA1='{"type":"A","name":"hostname.example.com","content":"'
DATA2='","ttl":120,"proxied":false}'

DATA="$DATA1$IP$DATA2"

curl -X PUT "https://api.cloudflare.com/client/v4/zones/$ZONEID/dns_records/$RECORDID" \
     -H "X-Auth-Email: $USERNAME" \
     -H "X-Auth-Key: $APIKEY" \
     -H "Content-Type: application/json" \
     --data $DATA
