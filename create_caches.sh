#! /bin/sh

docker.io run -v /var/cache/apt/archives --name rock_cache_apt debian:unstable true
docker.io run -v /var/cache/zypp/packages --name rock_cache_zypper sylvainjoyeux/opensuse-13.1 true
docker.io run -v /var/cache/yum --name rock_cache_yum fedora:20 true
docker.io run -v /var/cache/pacman/pkg --name rock_cache_pacman base/archlinux true
