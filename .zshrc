autoload -U colors && colors
GIT_BRANCH_ICON='\ue0a0'
COLOR_DEF=$'%F{magenta}'
COLOR_DIR=$'%F{blue}'
COLOR_GIT=$'%F{red}'
COLOR_RESET=$'%f'
function git_branch() {
  ref=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -n "$ref" ]; then
     echo " ${BOLD}${GIT_BRANCH_ICON} $ref${RESET_BOLD}"
  fi
  
}

setopt PROMPT_SUBST
PS1='${COLOR_DIR}%~${COLOR_GIT}$(git_branch)${COLOR_DEF}   ${COLOR_RESET}'
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

## sources
eval "$(zoxide init --cmd cd zsh)"
source <(fzf --zsh)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
