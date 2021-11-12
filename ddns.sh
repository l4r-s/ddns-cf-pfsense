#!/bin/sh
# pfsense/opnsense ddns to cloudflare script

INTERFACE="wan-interface"
APIKEY="cloudflare-api-key"
ZONEID="cloudflare-api-zone-id"
RECORDID="cloudflare-api-record-id"
LOGFILE="ddns.log"

ipv4=`ifconfig ${INTERFACE} | grep "inet " | awk '{ print $2 }'`

data1='{"type":"A","name":"h.l4rs.net","content":"'
data2='","ttl":120,"proxied":false}'
data_ipv4="${data1}${ipv4}${data2}"

resp=$(curl -X PUT "https://api.cloudflare.com/client/v4/zones/${ZONEID}/dns_records/${RECORDID}" \
     -H "Authorization: Bearer ${APIKEY}" \
     -H "Content-Type: application/json" \
     --data ${data_ipv4})

success="$(echo ${resp} | jq .success)"

if [ "${success}" = "true" ]; then
    echo "$(date) - ${ipv4} - ddns successfull" >> ${LOGFILE}
else
    echo "$(date) - ${ipv4} - ddns failed: ${resp}" >> ${LOGFILE}
fi

