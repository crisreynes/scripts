# Go to home directory
cd ~
# Ask for sudo credentials
sudo -v
# Download & install JetBrainsMono Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip -O ~/Downloads/jetbrainsmono.zip
mkdir -p ~/.local/share/fonts/jetbrainsmono-nerd-font
unzip ~/Downloads/jetbrainsmono.zip -d ~/.local/share/fonts/jetbrainsmono-nerd-font
fc-cache -fv

# Add settings to /etc/dnf/dnf.conf
sudo bash -c "echo '# Added settings' >> /etc/dnf/dnf.conf"
sudo bash -c "echo 'fastestmirror=True' >> /etc/dnf/dnf.conf"
sudo bash -c "echo 'max_parallel_downloads=10' >> /etc/dnf/dnf.conf"
sudo bash -c "echo 'defaultyes=True' >> /etc/dnf/dnf.conf"
sudo bash -c "echo 'keepcache=True' >> /etc/dnf/dnf.conf"
# Update system
sudo dnf -y update 
# Enable RPM Fusion
sudo dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Add VSCodium repo GPG key
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
# Add VSCodium repo
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

# Install packages
sudo dnf -y install bat cmatrix cmus codium exa gcc-c++ git kitty mpv libreoffice neofetch neovim obs-studio python3-pip qbittorrent redshift rofi steam-devices stow syncthing tldr unrar vifm vlc VirtualBox WoeUSB xkill zathura zathura-pdf-poppler
# Download mailspring rpm
wget https://updates.getmailspring.com/download?platform=linuxRpm -O ~/Downloads/mailspring.rpm
# Install mailspring rpm
sudo dnf -y install ~/Downloads/mailspring.rpm

# Enable Flathub
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Install flatpak packages
flatpak install -y flathub com.discordapp.Discord com.github.tchx84.Flatseal com.heroicgameslauncher.hgl com.spotify.Client com.valvesoftware.Steam io.gitlab.librewolf-community md.obsidian.Obsidian net.ankiweb.Anki net.davidotek.pupgui2 org.libretro.RetroArch org.ppsspp.PPSSPP org.prismlauncher.PrismLauncher org.telegram.desktop us.zoom.Zoom

# ~/.local/bin/
pip install --user bumblebee-status
pip install --user pulsemixer

# Clone .dotfiles
git clone https://github.com/crisreynes/.dotfiles
