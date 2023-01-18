# add some path
fish_add_path ~/.scripts
fish_add_path ~/.local/bin
fish_add_path /usr/local/bin
fish_add_path ~/.config/composer/vendor/bin

# init starship default prompts
# starship init fish | source

# aliases sections
alias art="./artisan"
alias gu="lazygit"
alias artisan="./artisan"
alias artisan7="php7 ./artisan"
alias dc="docker-compose"
alias pm="python manage.py"
alias tmuxproject="tmuxinator"
alias se="sudo -E"
alias composer7="/usr/bin/php7 /usr/bin/composer"
alias update-font-cache="fc-cache -f -v"
alias vi="nvim"
alias v="nvim"
alias create-laravel-project="composer create-project laravel/laravel"
alias create-vite-project="pnpm create vite"
alias readme-md-generator="pnpx readme-md-generator"
alias odoo-readme-md-to-description="mkdir -p static/description && github-markdown README.md > static/description/index.html"
alias adb-push-public-key="adb push ~/.android/adbkey.pub /data/misc/adb/adb_keys"
alias adb-screenshot="adb exec-out screencap -p > ~/Pictures/screenshots/android-$(date +"%Y-%m-%d-%H-%M-%S").png"
alias tmux-save-pane='tmux capture-pane -pS -'
alias pnpm-install-aura-erp-installer="pnpm add -g git+ssh://git@gitlab.com:aura-erp/installer.git"
alias pac="sudo pacman"

alias sync-odoo-addons="rsync -azP ~/odoo/addons/ pangat@192.168.10.112:/home/pangat/odoo-15/addons/"
alias pulseaudi-stream-simple-protocol-tcp="pactl load-module module-simple-protocol-tcp source=102 record=true port=12345 && adb reverse tcp:12345 tcp:12345"
alias nchat-wa="nchat -d ~/.nchat-main-wa"


# auto start sway
if test (tty) = /dev/tty1
    exec tbsm
end


# pnpm
set -gx PNPM_HOME "/home/deve/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
