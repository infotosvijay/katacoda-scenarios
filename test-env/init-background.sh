#!/bin/bash

mkdir /test
cd /test
touch file.log
echo "First line" >> file.log
adduser frontend
chmod 700 file.log

apt-get update -y
apt-get install apache2 -y
apt-get install nginx -y
chown frontend:frontend file.log 
chattr +a file.log

seq 1 1000 > out.log

for i in 1 2 3 4; do while : ; do : ; done & done

# Common curl switches
echo '-s' >> ~/.curlrc

# Signal to challenge controller that the startup is complete
echo 'done' > /opt/katacoda-background-finished

# Signal to init-forground.sh that the startup is complete
echo 'done' > /opt/.backgroundfinished
