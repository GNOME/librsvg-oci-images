#!/bin/sh

apt-get update -yqq
apt-get install -yqq gcc make valac rustc cargo \
    automake autoconf libtool gettext itstool \
    libgdk-pixbuf2.0-dev libgirepository1.0-dev \
    gtk-doc-tools git libgtk-3-dev ccache \
    libxml2-dev libcroco3-dev libcairo2-dev libpango1.0-dev
