#!/bin/bash

# Open a reverse tunnel to a server to allow connecting into this machine

set -e -x

# Try to get a shell into Travis
cat disclaimer.txt

# Allow connecting to the ssh server
cat id_rsa-initd-upload.pub >> ~/.ssh/authorized_keys

# Keep writing on stdout to avoid being disconnected after 10 mins
while true; do echo "now is $(date)"; sleep 60; done &

# Open a tunnel where I can pick it up
ssh -i /tmp/id_rsa-initd-upload -N -v \
	-o 'UserKnownHostsFile known_hosts' -o 'StrictHostKeyChecking yes' \
	-R 2223:localhost:22 piro@initd.org
