export CM_LAUNCHER=rofi
export CM_DIR=~/.cache/clipmenu
# export LC_ALL=en_US.UTF-8
export QT_QPA_PLATFORMTHEME=qt5ct
export FONT_NAME="JetBrainsMono Nerd Font 10"

# For Android Studio
# export _JAVA_AWT_WM_NONREPARENTING=1

export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk
# For Gradle
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk


# add ruby gem path and home
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# default editor
export EDITOR=nvim
# export TERMINAL=/usr/bin/alacritty
export TERMINAL=/usr/bin/alacritty
export PATH=$PATH:~/.scripts


# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
#

# export GTK_THEME="Matcha-dark-sea"
# export ICON_THEME="Breeze Dark"
