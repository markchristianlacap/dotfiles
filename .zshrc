########################################
# Environment
########################################
export PATH="$HOME/.dotnet/tools:$HOME/.cargo/bin:$PATH"
export EDITOR="nvim"
export TERM="xterm-256color"

########################################
# History
########################################
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.cache/zsh/history"

setopt inc_append_history      # Append history, don’t overwrite
setopt share_history           # Share history across sessions
setopt hist_ignore_dups        # Don’t record duplicates
setopt hist_reduce_blanks      # Trim unnecessary spaces

########################################
# Options
########################################
setopt autocd                  # Just type dir to cd
setopt prompt_subst            # Allow prompt functions

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
zstyle ':completion:*' menu select
zmodload zsh/complist
autoload -Uz compinit
compinit

########################################
# Plugins
########################################
# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# VI mode
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# Disable default ^R binding to work with fzf
function zvm_after_init() {
  zvm_bindkey viins "^R" fzf-history-widget
}

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)


# Zoxide (smart cd)
eval "$(zoxide init --cmd cd zsh)"


