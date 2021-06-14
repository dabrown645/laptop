bash

# Add archzfs repo
curl -L https://archzfs.com/archzfs.gpg |  pacman-key -a -
curl -L https://git.io/JsfVS | xargs -i{} pacman-key --lsign-key {}
curl -L https://git.io/Jsfw2 > /etc/pacman.d/mirrorlist-archzfs

tee -a /etc/pacman.conf <<- 'EOF'

#[archzfs-testing]
#Include = /etc/pacman.d/mirrorlist-archzfs

[archzfs]
Include = /etc/pacman.d/mirrorlist-archzfs
EOF

pacman -Sy


#LIVE_ZFS_PKG="zfs-linux-2.0.4_5.12.8.arch1.1-1-x86_64.pkg.tar.zst"
#LIVE_ZFS_UTILS="zfs-utils-2.0.4-2-x86_64.pkg.tar.zst"
LIVE_ZFS_PKG="zfs-linux-2.0.4_5.11.8.arch1.1-1-x86_64.pkg.tar.zst"
LIVE_ZFS_UTILS="zfs-utils-2.0.4-1-x86_64.pkg.tar.zst"
LIVE_ZFS_MIRROR="https://mirror.sum7.eu/archlinux/archzfs"

pacman -U --noconfirm ${LIVE_ZFS_MIRROR}/archzfs/x86_64/${LIVE_ZFS_UTILS} || \
pacman -U --noconfirm ${LIVE_ZFS_MIRROR}/archive_archzfs/${LIVE_ZFS_UTILS}

pacman -U --noconfirm ${LIVE_ZFS_MIRROR}/archzfs/x86_64/${LIVE_ZFS_PKG} || \
pacman -U --noconfirm ${LIVE_ZFS_MIRROR}/archive_archzfs/${LIVE_ZFS_PKG}

modprobe zfs

