function git_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null || echo ""
}
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m %F{blue}%~ %F{red}$(git_branch)
%F{#90ee90}$ %{$reset_color%}'
export PATH=$HOME/.dotnet/tools:$HOME/.cargo/bin:$PATH
export EDITOR=nvim
export TERM=xterm-256color
autoload -U colors && colors
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
alias ls="eza --icons"
alias la="eza --icons -a"
alias ll="eza --icons -l"
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
autoload -U compinit; compinit
