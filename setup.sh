#!/bin/bash

# Make users and group
sudo useradd sonarr -u 13001
sudo useradd radarr -u 13002
sudo useradd prowlarr -u 13003
sudo useradd qbittorrent -u 13004
sudo groupadd mediacenter -g 13000
sudo usermod -a -G mediacenter sonarr
sudo usermod -a -G mediacenter radarr
sudo usermod -a -G mediacenter prowlarr
sudo usermod -a -G mediacenter qbittorrent

# Make directories
sudo mkdir -pv docker/{sonarr,radarr,prowlarr,qbittorrent}-config
sudo mkdir -pv data/{torrents,data}/{tv,movies}

# Set permissions
sudo chmod -R 775 data/
sudo chown -R $(id -u):mediacenter data/
sudo chown -R sonarr:mediacenter docker/sonarr-config
sudo chown -R radarr:mediacenter docker/radarr-config
sudo chown -R prowlarr:mediacenter docker/prowlarr-config
sudo chown -R qbittorrent:mediacenter docker/qbittorrent-config

sonarr_id=$(id sonarr -u)
radarr_id=$(id radarr -u)
prowlarr_id=$(id prowlarr -u)
qbit_id=$(id qbittorrent -u)
group_id=$(getent group adm | cut -d: -f3)

echo "SONARR_UID=${sonarr_id}" >> .env
echo "RADARR_UID=${radarr_id}" >> .env
echo "LIDARR_UID=${lidarr_id}" >> .env
echo "PROWLARR_UID=${prowlarr_id}" >> .env
echo "QBIT_UID=${qbit_id}" >> .env
echo "MEDIACENTER_GID=${group_id}" >> .env
