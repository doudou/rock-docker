#! /bin/sh

docker.io run --volumes-from rock_cache_apt debian:unstable du -csh /var/cache/apt/archives
docker.io run --volumes-from rock_cache_zypper sylvainjoyeux/opensuse-13.1 du -csh /var/cache/zypp/packages
docker.io run --volumes-from rock_cache_yum fedora:20 du -csh /var/cache/yum
docker.io run --volumes-from rock_cache_pacman base/archlinux du -csh /var/cache/pacman/pkg
docker.io run --volumes-from rock_cache_autoproj debian:unstable du -csh /home/rock/cache

