#!/bin/sh
set -xe
pkg="docker-compose"

latest_url="$(wget -q -O- \
    https://api.github.com/repos/docker/compose/releases/latest | \
    awk '/browser_download_url/ {gsub("\"", ""); print $2}'     | \
    grep Linux | grep -v sha)"
latest_version="$(basename "$(dirname "${latest_url}")")"

if "${pkg}" --version 2>/dev/null | grep "${latest_version}" >/dev/null 2>&1; then
    printf "%s\\n" "${pkg} is latest version"
else
    wget -O  "/usr/bin/${pkg}" "${latest_url}"
    chmod +x "/usr/bin/${pkg}"
fi

"${pkg}" --version
