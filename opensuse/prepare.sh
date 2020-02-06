#!/bin/sh

zypper update -y
zypper install -y gcc rust cargo rustfmt make vala \
    automake autoconf libtool gettext itstool git \
    gtk-doc gobject-introspection-devel gtk3-devel \
    libxml2-devel libcroco-devel cairo-devel \
    pango-devel gdk-pixbuf-devel ccache gettext-tools \
    xz
