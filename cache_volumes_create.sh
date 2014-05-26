#! /bin/sh

docker.io run -v /var/cache/apt/archives --name rock_cache_apt debian:unstable true
docker.io run -v /var/cache/zypp/packages --name rock_cache_zypper sylvainjoyeux/opensuse-13.1 true
docker.io run -v /var/cache/yum --name rock_cache_yum fedora:20 true
docker.io run -v /var/cache/pacman/pkg --name rock_cache_pacman base/archlinux true
( set -e
output=`cat Dockerfile.create_cache_volume | docker.io build -`
volume_id=`echo $output | grep "Successfully built" | awk '{print $NF}'`
docker.io run -v /home/rock/cache --name rock_cache_autoproj $volume_id true
) || echo "failed to build rock_cache_autoproj"
