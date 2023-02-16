# Add settings to /etc/dnf/dnf.conf
sudo bash -c "echo '# Added settings' >> /etc/dnf/dnf.conf"
sudo bash -c "echo 'fastestmirror=True' >> /etc/dnf/dnf.conf"
sudo bash -c "echo 'max_parallel_downloads=10' >> /etc/dnf/dnf.conf"
sudo bash -c "echo 'defaultyes=True' >> /etc/dnf/dnf.conf"
sudo bash -c "echo 'keepcache=True' >> /etc/dnf/dnf.conf"
# Enable RPM Fusion
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# Enable Flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Update system
sudo dnf -y update 
# Add VSCodium repo GPG key
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
# Add VSCodium repo
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
# Install packages
sudo dnf -y install bat cmatrix cmus codium exa feh gcc-c++ git kitty mpv libreoffice neofetch neovim obs-studio python3-pip qbittorrent redshift rofi steam-devices stow syncthing tldr unrar vifm vlc VirtualBox WoeUSB xkill zathura zathura-pdf-poppler

# ~/.local/bin/
pip install --user bumblebee-status
pip install --user pulsemixer

# Clone .dotfiles
git clone https://github.com/crisreynes/.dotfiles
