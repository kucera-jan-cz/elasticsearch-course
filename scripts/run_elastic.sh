#!/bin/bash

NODE=${1-:elasticsearch}
sudo -H -u elasticsearch bash -c "/usr/share/elasticsearch/bin/elasticsearch -Edefault.path.logs=/var/log/$NODE -Edefault.path.data=/var/lib/$NODE -Edefault.path.conf=/etc/$NODE"
