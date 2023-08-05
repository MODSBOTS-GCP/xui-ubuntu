#!/bin/bash

cd /usr/local/
#wget https://github.com/MHSanaei/3x-ui/releases/download/v1.7.5/x-ui-linux-amd64.tar.gz
wget -N --no-check-certificate -O /usr/local/x-ui-linux-amd64.tar.gz https://github.com/MHSanaei/3x-ui/releases/download/v1.7.5/x-ui-linux-amd64.tar.gz
tar zxvf x-ui-linux-amd64.tar.gz
rm x-ui-linux-amd64.tar.gz -f
cd x-ui
chmod +x x-ui bin/xray-linux-amd64
cp -f x-ui.service /etc/systemd/system/
wget --no-check-certificate -O /usr/bin/x-ui https://raw.githubusercontent.com/MHSanaei/3x-ui/main/x-ui.sh
chmod +x /usr/local/x-ui/x-ui.sh
chmod +x /usr/bin/x-ui
/usr/local/x-ui/x-ui setting -username modsbots -password modsbots
/usr/local/x-ui/x-ui setting -port 8080
/usr/local/x-ui/x-ui migrate
systemctl daemon-reload
systemctl enable x-ui
systemctl start x-ui
