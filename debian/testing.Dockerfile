FROM debian:testing

RUN apt update -yqq \
    && apt install -yqq --no-install-recommends \
    curl gcc make valac rustc cargo git \
    automake autoconf libtool gettext itstool \
    libgdk-pixbuf2.0-dev libgirepository1.0-dev \
    gtk-doc-tools libpango1.0-dev libgtk-3-dev \
    libxml2-dev libcroco3-dev libcairo2-dev \
    ca-certificates openssl libssl-dev \
    autotools-dev libltdl-dev autopoint \
    && apt clean \
    && rm -rf /var/lib/apt/lists \
    && cargo install cargo-c

ENV SHELL=/bin/bash

ENV HOST_USER_ID 5555
RUN useradd -u $HOST_USER_ID -ms /bin/bash user

USER user
WORKDIR /home/user

ENV LANG C.UTF-8

# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=907306
# export GDK_PIXBUF_QUERYLOADERS=/usr/lib/$(dpkg-architecture -qDEB_HOST_MULTIARCH)/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
ENV GDK_PIXBUF_QUERYLOADERS /usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders

# Make sure the build works \o/
# RUN git clone --depth 1 https://gitlab.gnome.org/GNOME/librsvg.git \
#     && cd librsvg && mkdir _build && cd _build \
#     && ../autogen.sh && make && make check
