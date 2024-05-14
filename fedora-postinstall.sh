#!/bin/bash
# Requires sudo privileges
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

# Install packages
dnf -y install bat cmatrix eza fastfetch ffmpegthumbnailer flameshot flatpak git go kitty mpv libreoffice neovim newsboat obs-studio picom qbittorrent redshift rofi steam steam-devices stow syncthing tldr unrar vlc VirtualBox WoeUSB xkill zathura zathura-pdf-poppler
dnf -y install cargo dbus-devel file-devel gcc-c++ giflib-devel imlib2-devel libexif-devel libwebp-devel libxcb-devel libXft-devel ncurses-devel openssl-devel pulseaudio-libs-devel python3-pip rust
# Download mailspring rpm
sudo -u $SUDO_USER wget https://updates.getmailspring.com/download?platform=linuxRpm -O /home/"$SUDO_USER"/Downloads/mailspring.rpm
# Install mailspring rpm
dnf -y install /home/"$SUDO_USER"/Downloads/mailspring.rpm

# Install cargo packages
sudo -u $SUDO_USER cargo install ncspot

# Enable Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Install flatpak packages
sudo -u $SUDO_USER flatpak install -y flathub com.discordapp.Discord com.github.tchx84.Flatseal com.heroicgameslauncher.hgl io.gitlab.librewolf-community md.obsidian.Obsidian net.ankiweb.Anki net.davidotek.pupgui2 org.libretro.RetroArch org.ppsspp.PPSSPP org.prismlauncher.PrismLauncher org.telegram.desktop us.zoom.Zoom

# Install snapd
dnf -y install snapd
# Install snap packages
snap install postman

# ~/.local/bin/
sudo -u $SUDO_USER pip install --user bumblebee-status
sudo -u $SUDO_USER pip install --user pulsemixer

# Repos
sudo -u $SUDO_USER mkdir ~/repos
# ctpv
sudo -u $SUDO_USER git clone https://github.com/NikitaIvanovV/ctpv ~/repos/ctpv
# nsxiv
sudo -u $SUDO_USER git clone https://github.com/nsxiv/nsxiv ~/repos/nsxiv
# Install tmux plugin manager
sudo -u $SUDO_USER git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# .dotfiles
sudo -u $SUDO_USER git clone https://github.com/crisreynes/.dotfiles
