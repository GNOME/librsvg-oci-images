FROM registry.fedoraproject.org/fedora:33

RUN dnf upgrade -y && \
    dnf install -y gcc rust rust-std-static cargo make vala \
    automake autoconf libtool gettext itstool \
    gdk-pixbuf2-devel gobject-introspection-devel \
    gtk-doc git redhat-rpm-config gtk3-devel ccache \
    libxml2-devel cairo-devel pango-devel \
    gettext-devel && \
    dnf install -y https://kojipkgs.fedoraproject.org/packages/rust-cargo-c/0.6.10/2.fc33/x86_64/cargo-c-0.6.10-2.fc33.x86_64.rpm
RUN dnf clean all

# Enable sudo for wheel users
RUN sed -i -e 's/# %wheel/%wheel/' -e '0,/%wheel/{s/%wheel/# %wheel/}' \
    /etc/sudoers

ENV HOST_USER_ID 5555
RUN useradd -u $HOST_USER_ID -G wheel -ms /bin/bash user

USER user
WORKDIR /home/user

ENV LANG C.UTF-8
