FROM opensuse/tumbleweed

ENV SHELL=/bin/bash

RUN zypper update -y && \
    zypper install -y gcc ccache make vala \
    rust rustfmt cargo cargo-c clippy \
    automake autoconf libtool curl git gtk-doc \
    cairo-devel gdk-pixbuf-devel \
    gobject-introspection-devel gtk3-devel \
    pango-devel libxml2-devel \
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
