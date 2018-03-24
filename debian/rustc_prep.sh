#!/bin/sh

apt update -yqq
apt install -yqq --no-install-recommends \
    gcc make valac curl wget libpango1.0-dev \
    automake autoconf libtool gettext itstool \
    libgdk-pixbuf2.0-dev libgirepository1.0-dev \
    gtk-doc-tools git libgtk-3-dev ccache \
    libxml2-dev libcroco3-dev libcairo2-dev
