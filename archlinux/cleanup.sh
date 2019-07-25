#!/bin/sh

set -eu

echo "Removing pacman cache"
pacman -Scc

echo "Removing Rust package build dir"
rm -rf mingw-w64-rust-bin

rm -R /root/*
