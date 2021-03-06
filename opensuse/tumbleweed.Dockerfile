FROM opensuse/tumbleweed

ENV SHELL=/bin/bash

RUN zypper update -y && \
    zypper install -y gcc rust cargo cargo-c \
    clippy rustfmt gdb rust-gdb rr make vala \
    automake autoconf curl gettext git itstool libtool \
    gtk-doc gobject-introspection-devel gtk3-devel \
    libxml2-devel cairo-devel \
    pango-devel gdk-pixbuf-devel ccache gettext-tools \
    sudo shadow system-group-wheel xz
RUN zypper clean -a

RUN mkdir -p /opt/cargo && \
    cargo install --root /opt/cargo --version ^1.0 gitlab_clippy

ENV PATH="${PATH}:/opt/cargo/bin"

# Enable sudo for wheel users
RUN sed -i -e 's/# %wheel/%wheel/' -e '0,/%wheel/{s/%wheel/# %wheel/}' \
    /etc/sudoers

ENV HOST_USER_ID 5555
RUN useradd -u $HOST_USER_ID -G wheel -ms /bin/bash user

USER user
WORKDIR /home/user

ENV LANG C.UTF-8
