#!/bin/sh

BLUE="$(printf "\\033[0;34m")"
DEFAULT="$(printf "\\033[0;39m")"
RED="$(printf "\\033[0;31m")"
BROWN="$(printf "\\033[0;33m")"
CYAN="$(printf "\\033[0;36m")"
DARK_GREY="$(printf "\\033[1;30m")"
GREEN="$(printf "\\033[0;32m")"
LIGHT_BLUE="$(printf "\\033[1;34m")"
LIGHT_CYAN="$(printf "\\033[1;36m")"
LIGHT_GREEN="$(printf "\\033[1;32m")"
LIGHT_GREY="$(printf "\\033[0;37m")"
LIGHT_PURPLE="$(printf "\\033[1;35m")"
LIGHT_RED="$(printf "\\033[1;31m")"
PURPLE="$(printf "\\033[1;35m")"
WHITE="$(printf "\\033[1;37m")"
YELLOW="$(printf "\\033[0;33m")"

#echo executed cmds
set -x

#enable passwordless sudo wheel group
addgroup wheel
echo '%wheel ALL = (ALL) NOPASSWD: ALL' | tee /etc/sudoers.d/wheel
#create admin user
addgroup admin || :
adduser --quiet --disabled-password --shell /bin/bash --home /home/admin --gecos 'User' admin --ingroup admin

passwd="$(cat /dev/urandom | tr -d '\000' | grep -o '[0-9a-Z_./~:,;()!?%*#$%&+=@-]' | \
          head -n "50" | tr -d '\n' 2>/dev/null)"
printf "%s\\n" "admin:${passwd}" | chpasswd
usermod -a -G wheel admin

#enable ssh access
mkdir /home/admin/.ssh
cp -r ~/.ssh/authorized_keys /home/admin/.ssh/authorized_keys
chown -R admin:admin /home/admin/.ssh

#print admin password
printf "%s\\n" "${GREEN}admin:${passwd}${DEFAULT}"
