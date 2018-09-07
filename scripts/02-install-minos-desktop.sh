#!/bin/sh
set -xe

MINOS_EDITION="desktop"

wget -q -O- minos.io/s | sh /dev/stdin "${MINOS_EDITION}"
dpkg -l minos-"${MINOS_EDITION}"
