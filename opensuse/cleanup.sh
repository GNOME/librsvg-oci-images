#!/bin/sh

set -eu

echo "Removing zypper cache"
zypper clean -a

rm -R /root/*