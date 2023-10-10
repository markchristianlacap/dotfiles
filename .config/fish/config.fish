# prompt
starship init fish | source

# vi mode
fish_vi_key_bindings
 
# variables
set fish_greeting
set PATH  /home/mark/.dotnet/tools $PATH
set SSH_AUTH_SOCK
set _JAVA_AWT_WM_NONREPARENTING 1
set AWT_TOOLKIT MToolkit

# abbr
abbr --add sc sudo systemctl
abbr --add p pnpm
abbr --add g git
abbr --add gc git clone
abbr --add gs git status
abbr --add ga git add
abbr --add gp git push
abbr --add gpl git pull
abbr --add gcm git commit -m
abbr --add gco git checkout
abbr --add vim nvim
abbr --add dc docker compose

# aliases
alias ls 'ls -h --color=auto'
alias ll 'ls -lh --color=auto'
alias la 'ls -a --color=auto'
alias lla 'ls -alh --color=auto'
alias l 'ls -CF --color=auto'

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
