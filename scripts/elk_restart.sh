#!/bin/bash
IP=`hostname -I|cut -f1 -d ' '`

systemctl restart elasticsearch
curl -s -o /dev/null http://localhost:9200/_cluster/health?wait_for_status=yellow

sed -i "s/^server.host:.*/server.host: \"$IP\"/g" /etc/kibana/kibana.yml
systemctl restart kibana

systemctl restart cerebro

systemctl restart logstash
