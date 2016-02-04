####!/bin/bash
echo "########### The server will reboot when the script is complete..."
echo "########### Changing to home dir..."
cd ~
#
####Update Server####
echo "########### Updating Ubuntu..."
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install software-properties-common python-software-properties -y
sudo apt-get install build-essential libssl-dev libdb-dev libdb++-dev libboost-all-dev git libssl1.0.0-dbg -y
sudo apt-get install libdb-dev libdb++-dev libboost-all-dev libminiupnpc-dev libminiupnpc8 libevent-dev libcrypto++-dev libgmp3-dev -y
#
####Install Firewall####
echo "########### Firewall rules"
sudo apt-get install ufw -y
sudo ufw allow 80/tcp
sudo ufw allow 22/tcp
sudo ufw allow 21/tcp
sudo ufw --force enable
#
####Install PHP5####
echo "########### Installing PHP5..."
sudo apt-get install php5 libapache2-mod-php5 -y
sudo service apache2 restart
#
####Install cURL####
echo "########### Installing cURL..."
sudo apt-get install php5-curl -y
sudo apache2ctl restart
#
####Create Swap File####
echo "########### Creating Swap..."
sudo dd if=/dev/zero of=/swapfile bs=1M count=1024
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
#
echo "########### Thanks to Max Kaye."
echo "########### Modified by SPEC Dev Team dev@speccoin.com"
echo "Rebooting..."
reboot
