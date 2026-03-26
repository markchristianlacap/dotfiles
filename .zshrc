########################################
# Environment
########################################
export PATH="$HOME/.dotnet/tools:$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export TERM="xterm-256color"

########################################
# History
########################################
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.cache/zsh/history"

setopt inc_append_history      # Append history
setopt share_history           # Share across sessions
setopt hist_ignore_dups        # Ignore duplicates
setopt hist_reduce_blanks      # Trim spaces

########################################
# Options
########################################
setopt autocd
setopt prompt_subst

########################################
# Prompt
########################################
autoload -U colors && colors

git_branch() {
  git symbolic-ref --quiet --short HEAD 2>/dev/null || :
}

git_branch_prompt() {
  local branch
  branch=$(git_branch)
  [[ -n $branch ]] && print " %F{red}$branch"
}

PROMPT='%F{green}%n@%m %F{blue}%~$(git_branch_prompt)
%F{yellow}$ %{$reset_color%}'

########################################
# Functions
########################################
# Open yazi and return to last directory
y() {
  local tmp cwd
  tmp=$(mktemp -t "yazi-cwd.XXXXXX") || return
  trap 'rm -f "$tmp"' EXIT
  yazi "$@" --cwd-file="$tmp"

  if IFS= read -r -d '' cwd <"$tmp" && [[ -n $cwd && $cwd != $PWD ]]; then
    builtin cd -- "$cwd"
  fi

  trap - EXIT
}

########################################
# Aliases
########################################
alias vim="nvim"
alias vi="nvim"

alias ls="eza --icons"
alias la="eza --icons -a"
alias ll="eza --icons -l"

alias cls="clear"
alias p="pnpm"
alias pa="php artisan"
alias dc="docker compose"
alias sc="sudo systemctl"

########################################
# Completion
########################################
zmodload zsh/complist
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

########################################
# Plugins
########################################
# Detect plugin base path
if command -v brew >/dev/null 2>&1; then
  base="$(brew --prefix)/share"
else
  base="/usr/share/zsh/plugins"
fi

# Load plugins (order matters: highlighting last)
[ -f "$base/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && \
  source "$base/zsh-autosuggestions/zsh-autosuggestions.zsh"

[ -f "$base/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ] && \
  source "$base/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

[ -f "$base/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
  source "$base/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# zsh-vi-mode config
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM

function zvm_after_init() {
  zvm_bindkey viins "^R" fzf-history-widget
  bindkey "^g" autosuggest-accept
}

########################################
# Tools
########################################
# fzf
source <(fzf --zsh)

# zoxide
eval "$(zoxide init --cmd cd zsh)"

########################################
# Docker (optional, macOS-specific)
########################################
if [ -d "$HOME/.docker/completions" ]; then
  fpath=("$HOME/.docker/completions" $fpath)
fi
