#!/bin/bash

echo "UPDATING THE SYSTEM..."
# updates the system and install dnf utils for other installation like vivaldi
sudo dnf update --refresh -y

sleep 10
echo "INSTALLING VIVALDI..."
# install vivaldi from fedora repos
sudo dnf install dnf-utils -y
sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo
sudo dnf update -y
sudo dnf install vivaldi-stable -y

sleep 10
# install alacritty
echo "INSTALLING ALACRITTY..."
sudo dnf makecache --refresh
sudo dnf -y install alacritty

sleep 10
echo "INSTALLING VSCODE"
# install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf -y install code

sleep 10
echo "INSTALLING SPOTIFY FROM FLATHUB..."
# install Spotify through the flathub
sudo dnf install -y flatpak
sudo flatpak install -y --from https://flathub.org/repo/appstream/com.spotify.Client.flatpakref
flatpak run com.spotify.Client

sleep 10
echo "INSTALLING VIRTUALBOX AND ALL THE DEPENDECIES..."
# install all the dependecies for virtualbox and install it
sudo dnf -y insatll @developement-tools
sudo dnf -y install kernel-headers kernel-devel dkms elfutils-libelf-devel qt5-qtx11extras
cat <<EOF | sudo tee /etc/yum.repos.d/virtualbox.repo 
[virtualbox]
name=Fedora $releasever - $basearch - VirtualBox
baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/36/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://www.virtualbox.org/download/oracle_vbox.asc
EOF

sudo dnf search virtualbox -y
sudo dnf -y install VirtualBox-6.1

sleep 10
echo "INSTALLING NOTION FROM SNAP :'("
# install notion through snap  :(
sudo dnf -y install snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install notion-snap

sleep 10
echo "INSTALLING TODOIST FROM FLATHUB"
# install Todoist through flathub
flatpak install -y flathub com.todoist.Todoist
flatpak run com.todoist.Todoist

sleep 10
echo "INSTALLING NORDVPN..."
# install nordvpn 
sudo dnf -y install wget
wget -qnc https://repo.nordvpn.com/yum/nordvpn/centos/noarch/Packages/n/nordvpn-release-1.0.0-1.noarch.rpm

sleep 10
echo "REBOOTING!!!!!!!!!!!!!!!!!!!!!!!"
reboot
