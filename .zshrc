export PATH=$HOME/.dotnet/tools:$HOME/.scripts:~/.console-ninja/.bin:$HOME/.cargo/bin:$PATH
export EDITOR=nvim

autoload -U colors && colors
setopt PROMPT_SUBST
PS1='%F{blue}%~ %F{green}> %f'
setopt autocd	
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=$HOME/.cache/zsh/history
setopt inc_append_history

zstyle ':completion:*' menu select
zmodload zsh/complist
autoload -Uz compinit
compinit

# # vi mode
bindkey -v

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

## aliases
alias vim="nvim"
alias vi="nvim"
alias ls="exa --icons"
alias la="exa --icons -a"
alias ll="exa --icons -l"
alias cls="clear"
alias p="pnpm"
alias pa="php artisan"
alias dc="docker compose"
alias sc="sudo systemctl"
alias ssh="kitty +kitten ssh"
## sources
eval "$(zoxide init --cmd cd zsh)"
source <(fzf --zsh)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
autoload -U compinit; compinit
