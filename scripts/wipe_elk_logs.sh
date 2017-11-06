#!/bin/bash

cd /var/log;
find elasticsearch/ -iname "*.log" -exec rm {} \;
find kibana/ -iname "*.stdout" -o -name "*.stderr" -exec rm {} \;
find logstash/ -iname "*.log" -exec rm {} \;
