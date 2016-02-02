####!/bin/bash
echo "########### The server will reboot when the script is complete..."
echo "########### Changing to home dir..."
cd ~
#
####Install Firewall####
echo "########### Firewall rules; allow 22,8333"
sudo ufw allow 8332/tcp
sudo ufw allow 8333/tcp
sudo ufw --force enable
#
####Clone Bitcoin Github - Install bitcoind####
echo "########### Adding ppa:bitcoinclassic/bitcoinclassic and installing bitcoind"
sudo mkdir ~/.bitcoin/
sudo apt-get install git -y
git clone https://github.com/bitcoinclassic/bitcoinclassic
cd bitcoinclassic/src/leveldb
chmod 755 build_detect_platform
sudo make libleveldb.a libmemenv.a
cd ..
sudo make -f makefile.unix
sudo strip bitcoind
sudo mv bitcoind /usr/bin/
#
####Create bitcoin.conf####
echo "########### Creating config..."
cd ~
config=".bitcoin/bitcoin.conf"
touch $config
echo "listen=1" > $config
echo "server=1" >> $config
echo "daemon=1" >> $config
echo "port=8333" >> $config
echo "rpcport=8332" >> $config
echo "maxconnections=80" >> $config
randUser=`< /dev/urandom tr -dc A-Za-z0-9 | head -c30`
randPass=`< /dev/urandom tr -dc A-Za-z0-9 | head -c30`
echo "rpcuser=$randUser" >> $config
echo "rpcpassword=$randPass" >> $config
#
####Autostart bitcoind Upon Server Start####
echo "########### Setting up autostart (cron)"
crontab -l > tempcron
echo "@reboot bitcoind -daemon" >> tempcron
crontab tempcron
rm tempcron
echo "Rebooting..."
reboot
