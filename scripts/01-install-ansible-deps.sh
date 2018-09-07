#!/bin/sh
set -x #echo executed cmds

#install ansible deps
apt-get -y update && apt-get -y install python python-pip sudo
