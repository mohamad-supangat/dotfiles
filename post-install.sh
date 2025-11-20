#! /bin/bash -e
# running this as root

# cachotick aur
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf

# required package
sudo pacman -S fish tmux openssh git neovim neovim-drop-in dos2unix

# developtment
sudo pacman -S nodejs npm pnpm composer php php-gd

# desktop application
sudo pacman -S sway pcmanfm-gtk3 xarchiver

# sublime merge
sudo bash -c 'curl -O https://download.sublimetext.com/sublimehq-pub.gpg && pacman-key --add sublimehq-pub.gpg && pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | tee -a /etc/pacman.conf'

# best commit reader based on local cbz
bash <(curl -s https://raw.githubusercontent.com/yumenaka/comi/master/get_comigo.sh)

# python
sudo pacman -S python python-pipx

# tmuxp
sudo pacman -S tmuxp
pipx install rofi-tmuxp

# best youtube cli with mpv integration
# pipx install yewtube

# youtube music tui
# wget -P ~/.local/bin/ https://github.com/sudipghimire533/ytui-music/releases/download/main/ytui_music-linux-amd64 && chmod +x ~/.local/bin/ytui_music-linux-amd64

# install bebasid
wget -P ~/.local/bin/ https://github.com/bebasid/bebasid/releases/download/v1.1/bebasid.sh && chmod +x ~/.local/bin/bebasid.sh && dos2unix ~/.local/bin/bebasid.sh

# editorconfig generator
pnpm add -g generate generate-editorconfig

wget -P /tmp https://rubjo.github.io/victor-mono/VictorMonoAll.zip && mkdir -p ~/.local/share/fonts/VictorMono && cd ~/.local/share/fonts/VictorMono && unzip /tmp/VictorMonoAll.zip

# install bun.js
curl -fsSL https://bun.com/install | bash # for macOS, Linux, and WSL

# install quasar/cli
bun install -g @quasar/cli


# install franken cli
curl https://frankenphp.dev/install.sh | sh
sudo mv frankenphp /usr/local/bin/
sudo setcap 'cap_net_bind_service=+ep' /usr/local/bin/frankenphp
