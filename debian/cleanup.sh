#!/bin/sh

set -eu

echo "Removing apt cache"
apt-get clean
rm -rf /var/lib/apt/lists

rm -R /root/*