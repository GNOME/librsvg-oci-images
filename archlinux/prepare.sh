#!/bin/sh

cat <<EOF >> /etc/pacman.conf
[ownstuff]
SigLevel = Optional TrustAll
Server = https://martchus.no-ip.biz/repo/arch/\$repo/os/\$arch
Server = https://ftp.f3l.de/~martchus/\$repo/os/\$arch
EOF

pacman -Sy
pacman --noconfirm --needed -S base-devel gdk-pixbuf2 git \
    gobject-introspection gtk-doc mingw-w64-cairo mingw-w64-configure \
    mingw-w64-freetype2 mingw-w64-gcc mingw-w64-gdk-pixbuf2 mingw-w64-libcroco \
    mingw-w64-libxml2 mingw-w64-pango

# makepkg cannot be ran as root
useradd builduser -m
passwd -d builduser
printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers

git clone https://aur.archlinux.org/mingw-w64-rust-bin.git
chown -R builduser mingw-w64-rust-bin
pushd mingw-w64-rust-bin
source PKGBUILD && pacman -Syu --noconfirm --needed --asdeps \
    "${makedepends[@]}" "${depends[@]}"
sudo -u builduser bash -c 'makepkg --skippgpcheck'
pacman --noconfirm -U mingw-w64-rust-bin-*.pkg.tar.gz
popd
