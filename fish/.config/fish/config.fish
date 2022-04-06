# add some path
fish_add_path ~/.scripts
fish_add_path ~/.local/bin
fish_add_path /usr/local/bin
fish_add_path ~/.config/composer/vendor/bin

# init starship default prompts
starship init fish | source

# aliases sections
alias art="./artisan"
alias artisan="./artisan"
alias artisan7="php7 ./artisan"
alias dc="sudo docker-compose"
alias pm="python manage.py"
alias tmuxproject="tmuxinator"
alias se="sudo -E"
alias composer7="/usr/bin/php7 /usr/bin/composer"

