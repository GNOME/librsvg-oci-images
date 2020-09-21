#!/bin/sh

apt update -yqq && apt upgrade -yqq
apt install -yqq --no-install-recommends \
    gcc make valac rustc cargo libpango1.0-dev \
    automake autoconf libtool gettext itstool \
    libgdk-pixbuf2.0-dev libgirepository1.0-dev \
    gtk-doc-tools git libgtk-3-dev ccache \
    libxml2-dev libcroco3-dev libcairo2-dev \
    ca-certificates openssl openssl-dev \
    autotools-dev libltdl-dev autopoint

cargo install cargo-c
