#!/bin/bash
# Requires sudo privileges
if [ $(id -u) -ne 0 ]; then
	echo Run this script using sudo!
	exit
fi
# Go to home directory
cd /home/"$SUDO_USER"

# Download & install JetBrainsMono Nerd Font
sudo -u $SUDO_USER wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip -O /home/"$SUDO_USER"/Downloads/jetbrainsmono.zip
sudo -u $SUDO_USER mkdir -p /home/"$SUDO_USER"/.local/share/fonts/jetbrainsmono-nerd-font
sudo -u $SUDO_USER unzip /home/"$SUDO_USER"/Downloads/jetbrainsmono.zip -d /home/"$SUDO_USER"/.local/share/fonts/jetbrainsmono-nerd-font
sudo -u $SUDO_USER fc-cache -fv

# Add settings to /etc/dnf/dnf.conf
bash -c "echo '# Added settings' >> /etc/dnf/dnf.conf"
bash -c "echo 'fastestmirror=True' >> /etc/dnf/dnf.conf"
bash -c "echo 'max_parallel_downloads=10' >> /etc/dnf/dnf.conf"
bash -c "echo 'defaultyes=True' >> /etc/dnf/dnf.conf"
bash -c "echo 'keepcache=True' >> /etc/dnf/dnf.conf"
# Update system
dnf -y update
# Enable RPM Fusion
dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf -y config-manager setopt fedora-cisco-openh264.enabled=1

# Install packages
dnf -y install bat cmatrix emacs eza fastfetch ffmpegthumbnailer flameshot flatpak git go imv kitty mpv libreoffice neovim newsboat picom qbittorrent qtile redshift rofi sddm snapd stow syncthing tealdeer unrar vlc WoeUSB xkill zathura zathura-pdf-poppler
dnf -y install cargo cmake dbus-devel file-devel gcc-c++ giflib-devel imlib2-devel libexif-devel libwebp-devel libxcb-devel libXft-devel ncurses-devel openssl-devel pulseaudio-libs-devel python3-pip rust
## RPM Fusion
dnf -y install cmus steam steam-devices VirtualBox

# Enable Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Install flatpak packages
## Gaming
sudo -u $SUDO_USER flatpak install -y flathub com.discordapp.Discord com.heroicgameslauncher.hgl net.davidotek.pupgui2 org.libretro.RetroArch org.prismlauncher.PrismLauncher
## General
sudo -u $SUDO_USER flatpak install -y flathub com.github.tchx84.Flatseal com.obsproject.Studio io.gitlab.librewolf-community net.ankiweb.Anki org.telegram.desktop us.zoom.Zoom

# ~/.local/bin/
sudo -u $SUDO_USER pip install --user bumblebee-status
sudo -u $SUDO_USER pip install --user pulsemixer
sudo -u $SUDO_USER pip install --user termdown

# Repos
sudo -u $SUDO_USER mkdir /home/"$SUDO_USER"/repos
# ctpv
sudo -u $SUDO_USER git clone https://github.com/NikitaIvanovV/ctpv /home/"$SUDO_USER"/repos/ctpv
# nsxiv
sudo -u $SUDO_USER git clone https://github.com/nsxiv/nsxiv /home/"$SUDO_USER"/repos/nsxiv
# Install tmux plugin manager
sudo -u $SUDO_USER git clone https://github.com/tmux-plugins/tpm /home/"$SUDO_USER"/.tmux/plugins/tpm
# keyd
sudo -u $SUDO_USER git clone https://github.com/rvaiya/keyd /home/"$SUDO_USER"/repos/keyd
# warpd
sudo -u $SUDO_USER git clone https://github.com/crisreynes/warpd /home/"$SUDO_USER"/repos/warpd
# Bibata Cursor
sudo -u $SUDO_USER git clone https://github.com/ful1e5/Bibata_Cursor /home/"$SUDO_USER"/repos/bibata-cursor
# .dotfiles
sudo -u $SUDO_USER git clone https://github.com/crisreynes/.dotfiles /home/"$SUDO_USER"/.dotfiles
