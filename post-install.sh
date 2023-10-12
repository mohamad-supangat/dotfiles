#! /bin/bash -e

# required package
pacman -S fish openssh git neovim neovim-drop-in

# developtment
pacman -S nodejs npm pnpm composer php php-gd

# desktop application
pacman -S sway pcmanfm-gtk3 xarchiver

# best commit reader based on local cbz
bash <(curl -s https://raw.githubusercontent.com/yumenaka/comi/master/get_comigo.sh)
