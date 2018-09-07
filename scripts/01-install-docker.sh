#!/bin/sh
set -xe
pkg="docker"

USERS="$(busybox cat /etc/passwd | busybox awk -F: '{if ($3 >= 1000 && $3 < 60000) print $1}')"

wget -q -O- https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-get update
apt-get install -y software-properties-common apt-transport-https
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce

#don't require sudo to run docker
for user in ${USERS}; do
    usermod -aG docker "${user}" || :
done

"${pkg}" --version
