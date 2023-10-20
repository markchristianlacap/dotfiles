# Exports
export VISUAL="nvim"
export EDITOR="$VISUAL"
set PATH $HOME/.dotnet/tools $PATH

# prompt
starship init fish | source

# vi mode
fish_vi_key_bindings
bind --mode insert --sets-mode default jk repaint

# variables
set fish_greeting

# abbreviations

# system
abbr --add sc sudo systemctl

# git
abbr --add gcm git commit -m
abbr --add gp git push
abbr --add gpl git pull
abbr --add ga git add
abbr --add gs git status
abbr --add gd git diff
abbr --add gco git checkout
abbr --add gl git log
abbr --add gaa git add --all
abbr --add g git

# docker
abbr --add d docker
abbr --add dc docker-compose
abbr --add dcb docker-compose build
abbr --add dcd docker-compose down
abbr --add dcr docker-compose run
abbr --add dce docker-compose exec
abbr --add dcl docker-compose logs
abbr --add dcu docker-compose up

#pnpm 
abbr --add p pnpm
abbr --add pi pnpm i
abbr --add pu pnpm up
abbr --add pr pnpm run

# tmux
abbr --add t tmux
abbr --add ta tmux attach
abbr --add tl tmux ls
abbr --add tk tmux kill-session
abbr --add tn tmux new-session

# aliases
alias ls 'ls -h --color=auto'
alias ll 'ls -lh --color=auto'
alias la 'ls -a --color=auto'
alias lla 'ls -alh --color=auto'
alias l 'ls -CF --color=auto'
alias vim nvim
alias vi nvim
alias cls clear
alias c cls

