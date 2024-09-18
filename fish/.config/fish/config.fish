set fish_greeting "Semangat jangan menyerah 😃"


# add some path
fish_add_path ~/.scripts
fish_add_path ~/.local/bin
fish_add_path /usr/local/bin
fish_add_path ~/.config/composer/vendor/bin
fish_add_path ~/.local/share/gem/ruby/3.0.0/bin
fish_add_path ~/.local/share/gem/ruby/3.2.0/bin
fish_add_path /usr/lib/jvm/default-runtime/bin
fish_add_path /opt/android-sdk/build-tools/30.0.3
fish_add_path ~/go/bin


# init starship default prompts
starship init fish | source

# aliases sections
alias ask="sgpt"
alias ls="ls -a --color"
alias ask="sgpt"
alias art="./artisan"
alias ace="node ace"
alias gu="lazygit"
alias artisan="./artisan"
alias artisan7="php7 ./artisan"
alias dc="docker-compose"
alias pm="python manage.py"
alias tmuxproject="tmuxinator"
alias se="sudo -E"
alias composer7="/usr/bin/php7 /usr/bin/composer"
alias update-font-cache="fc-cache -f -v"
alias vi="vim"
alias v="vim"
alias create-laravel-project="composer create-project laravel/laravel"
alias create-vite-project="pnpm create vite"
alias readme-md-generator="pnpx readme-md-generator"
alias odoo-readme-md-to-description="mkdir -p static/description && github-markdown README.md > static/description/index.html"
# alias adb="adb.exe"
alias adb-push-public-key="adb push ~/.android/adbkey.pub /data/misc/adb/adb_keys"
alias adb-screenshot="adb exec-out screencap -p > ~/Pictures/screenshots/android-$(date +"%Y-%m-%d-%H-%M-%S").png"
alias tmux-save-pane='tmux capture-pane -pS -'
alias pnpm-install-aura-erp-installer="pnpm add -g git+ssh://git@gitlab.com:aura-erp/installer.git"
alias pac="sudo pacman"
alias comigo="comi -c ~/.config/comigo/config.toml"


alias sync-odoo-addons-pangat="rsync -azP ~/odoo/addons/ pangat@192.168.10.112:/home/pangat/odoo-15/addons/"
alias sync-odoo-addons="rsync -azP ~/odoo/addons/ root@192.168.10.112:/home/saverid/odoo_22/addons/"

alias pulseaudi-stream-simple-protocol-tcp="pactl load-module module-simple-protocol-tcp source=102 record=true port=12345 && adb reverse tcp:12345 tcp:12345"
alias nchat-wa="nchat -d ~/.nchat-main-wa"
alias release-it-gitlab="release-it --gitlab.release"
alias release-it-github="release-it --github.release"
# alias mangal="docker run --rm -ti -e \"TERM=xterm-256color\" -v ~/Downloads/Manga/:/downloads -v ~/.config/mangal/config:/config metafates/mangal"
# alias glab-jvm="GITLAB_TOKEN=$GITLAB_JVM_TOKEN glab"
# alias release-it-jvm="GITLAB_TOKEN=$GITLAB_JVM_TOKEN release-it --gitlab.release"



# auto start sway
if test (tty) = /dev/tty1
    exec tbsm
end


# pnpm
set -gx PNPM_HOME "/home/deve/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


# ruby gem

#flutter
fish_add_path ~/tools/flutter/bin/

# android -sdk
set -gx ANDROID_HOME "/home/deve/tools/android/sdk/"
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path $ANDROID_HOME/tools
#
#
# set -x PHPENV_ROOT "/home/deve/.phpenv"
# if test -d "/home/deve/.phpenv"
#   set -x PATH "/home/deve/.phpenv/bin" $PATH
#   status --is-interactive; and . (phpenv init -|psub)
# end
#
#set -gx JAVA_HOME "/usr/lib/jvm/java-17-openjdk/"
set -gx EDITOR "nvim"
source ~/.private-env
