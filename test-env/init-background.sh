#!/bin/bash

launch.sh

# Log script activity (https://serverfault.com/a/103569)
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/var/log/init-background.log 2>&1
set -x
apt-get update -y
apt-get install apache2 -y

# mkdir /test
# cd /test
# touch file.log
# echo "First line" >> file.log
# adduser frontend
# chmod 700 file.log
# chattr +a file.log
# chown frontend:frontend file.log 

# seq 1 1000 > out.log

# apt-get install nginx -y

# for i in 1 2 3 4; do while : ; do : ; done & done

# # Common curl switches
# echo '-s' >> ~/.curlrc

# # Signal to challenge controller that the startup is complete
# echo 'done' > /opt/katacoda-background-finished

# # Signal to init-forground.sh that the startup is complete
# echo 'done' > /opt/.backgroundfinished
