FROM debian:testing

ENV SHELL=/bin/bash

RUN apt update -yqq \
    && apt install -yqq --no-install-recommends \
    curl gcc gdb git make rr valac rustc cargo \
    automake autoconf autopoint autotools-dev \
    libtool libltdl-dev gtk-doc-tools \
    libcairo2-dev libgdk-pixbuf2.0-dev \
    libgirepository1.0-dev \
    libpango1.0-dev libgtk-3-dev libxml2-dev \
    ca-certificates openssl libssl-dev
RUN apt clean && rm -rf /var/lib/apt/lists

RUN mkdir -p /opt/cargo && \
    cargo install --root /opt/cargo cargo-c

ENV PATH="${PATH}:/opt/cargo/bin"

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
