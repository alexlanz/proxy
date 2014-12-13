#!/bin/bash

# Locales
echo 'LANG="en_US.UTF-8"' | tee /etc/default/locale
echo 'LC_ALL="en_US.UTF-8"' | tee -a /etc/default/locale

# Hosts
cat /vagrant/hosts | tee -a /etc/hosts

# Updating
apt-get update
apt-get upgrade -y

# Squid
apt-get install -y squid3
cp -f /vagrant/squid.conf /etc/squid3/squid.conf
service squid3 restart