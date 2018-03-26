#!/bin/sh

dnf upgrade -y
dnf install -y gcc rust rust-std-static cargo make vala \
    automake autoconf libtool gettext itstool \
    gdk-pixbuf2-devel gobject-introspection-devel \
    gtk-doc git redhat-rpm-config gtk3-devel ccache \
    libxml2-devel libcroco-devel cairo-devel pango-devel
