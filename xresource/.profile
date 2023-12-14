
export CM_LAUNCHER=rofi
export CM_DIR=~/.cache/clipmenu
# export LC_ALL=en_US.UTF-8
export QT_QPA_PLATFORMTHEME=qt5ct
export FONT_NAME="JetBrainsMono Nerd Font 10"

# For Android Studio
# export _JAVA_AWT_WM_NONREPARENTING=1

# export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk
# For Gradle
# export JAVA_HOME=/usr/lib/jvm/java-20-openjdk
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
export ANDROID_HOME=/opt/android-sdk

export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH
export PATH=$ANDROID_HOME/cmdline-tools/latest/lib/:$PATH
export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH



# add some global path
export PATH="/home/$(whoami)/.scripts:$PATH"
export PATH="/home/$(whoami)/.local/bin:$PATH"
export PATH="/home/$(whoami)/.config/composer/vendor/bin:$PATH"
export PATH="/home/$(whoami)/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="/home/$(whoami)/go/bin:$PATH"

export PATH="/usr/lib/jvm/java-8-openjdk/bin:$PATH"
export PATH="/opt/android-sdk/build-tools/30.0.3:$PATH"





# for ruby
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# add ruby gem path and home
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# default editor
export EDITOR=nvim
# export TERMINAL=/usr/bin/alacritty
export TERMINAL=/usr/bin/alacritty
export PATH=$PATH:~/.scripts
export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh


# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
#

# export GTK_THEME="Matcha-dark-sea"
# export ICON_THEME="Breeze Dark"
[ -f "${HOME}/.gdrive-downloader/gdl" ] && [ -x "${HOME}/.gdrive-downloader/gdl" ] && PATH="${HOME}/.gdrive-downloader:${PATH}"

if [ -e ~/.private-env ]
then
    source ~/.private-env
fi

