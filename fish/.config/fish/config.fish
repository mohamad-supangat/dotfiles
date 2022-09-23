# add some path
fish_add_path ~/.scripts
fish_add_path ~/.local/bin
fish_add_path /usr/local/bin
fish_add_path ~/.config/composer/vendor/bin

# init starship default prompts
starship init fish | source

# aliases sections
alias art="./artisan"
alias gu="lazygit"
alias artisan="./artisan"
alias artisan7="php7 ./artisan"
alias dc="sudo docker-compose"
alias pm="python manage.py"
alias tmuxproject="tmuxinator"
alias se="sudo -E"
alias composer7="/usr/bin/php7 /usr/bin/composer"
alias update-font-cache="fc-cache -f -v"




# auto start sway
if test (tty) = "/dev/tty1"
  exec start-sway
end


# pnpm
set -gx PNPM_HOME "/home/deve/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
