# Get terminal emulator
set TERM_EMULATOR (ps -aux | grep (ps -p $fish_pid -o ppid=) | awk 'NR==1{print $11}')

# Exports
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Term
switch "$TERM_EMULATOR"
case '*kitty*'
	export TERM='xterm-kitty'
case '*'
	export TERM='xterm-256color'
end

# prompt
starship init fish | source

# vi mode
fish_vi_key_bindings

# variables
set fish_greeting
set PATH /home/mark/.dotnet/tools $PATH

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

# aliases
alias ls 'ls -h --color=auto'
alias ll 'ls -lh --color=auto'
alias la 'ls -a --color=auto'
alias lla 'ls -alh --color=auto'
alias l 'ls -CF --color=auto'
alias vim nvim
alias vi nvim
