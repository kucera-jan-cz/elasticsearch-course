!/bin/bash!

#Install Ansible 2.4
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt-get update
apt-get -y install ansible

echo "localhost ansible_connection=local" >> /etc/ansible/hosts


#Install Java
echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
apt-get update
apt-get -y install -t jessie-backports openjdk-8-jdk 
#apt-get -y install -t jessie-backports ca-certificates-java

#Elasticsearch 
wget --no-check-certificate -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
apt-get -y install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" >> /etc/apt/sources.list
#echo 'Acquire::https::artifacts.elastic.co::Verify-Peer "false";' >> /etc/apt/apt.conf.d/02elastic
apt-get update
apt-get -y install -t stable elasticsearch

apt-get -y install curl
apt-get -y install unzip
apt-get -y install ntp
apt-get -y install sudo
apt-get -y install vim-pathogen
apt-get -y install git-core

#Kibana
apt install -t stable kibana
printf 'server.host: "%s"\n' `hostname -I` >> /etc/kibana/kibana.yml

#Logstash
apt-get -y install logstash

echo "deb [arch=amd64] http://packages.elastic.co/curator/5/debian stable main" >> /etc/apt/sources.list
apt-get update
apt-get -y install elasticsearch-curator


./bin/logstash -t /etc/logstash/conf.d/movies.yml


mkdir -p ~/.vim/bundle


mkdir -p ~/.vim/indent
cd ~/.vim/indent
wget https://gist.githubusercontent.com/iangreenleaf/871107/raw/2f4f41f67a6ea668bfa4cfa156cea2f4872e974c/yaml.vim

#Rescue
apt-get install --reinstall logstash

#Replace
export IP=`hostname -I|cut -f1 -d ' '`
sed -i "s/^server.host:.*/server.host: \"$IP\"/g" /etc/kibana/kibana.yml