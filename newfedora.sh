#!/bin/bash

# updates the system and install dnf utils for other installation
sudo dnf update --refresh -y && sudo dnf upgrade -y
sudo dnf install dnf-utils -y

# install alacritty
sudo dnf makecache --refresh
sudo dnf install alacritty -y

# install vivaldi 
sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo
sudo dnf install vivaldi-stable -y

# install github desktop
sudo rpm --import https://packagecloud.io/shiftkey/desktop/gpgkey
sudo sh -c 'echo -e "[shiftkey]\nname=GitHub Desktop\nbaseurl=https://packagecloud.io/shiftkey/desktop/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/shiftkey/desktop/gpgkey" > /etc/yum.repos.d/shiftkey-desktop.repo'
sudo dnf install github-desktop -y

# install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code -y

# install Spotify through the flathub
sudo dnf upgrade --refresh -y
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub com.spotify.Client -y
flatpak run com.spotify.Client

# install lutris
sudo dnf install lutris -y

# install steam
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install steam -y

# enables copr and installs btm
sudo dnf copr enable atim/bottom -y
sudo dnf install bottom -y

# reboots the computer 
reboot
