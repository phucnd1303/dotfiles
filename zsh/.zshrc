export PATH=/opt/homebrew/bin:$PATH
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Setup GoLang
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Setup fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Setup zoxide
eval "$(zoxide init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Setup thefuck
eval $(thefuck --alias)

# Setup theme
ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
	git
	docker
	golang
	fzf-tab
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Set personal aliases
alias ls='eza -l --icons'
alias lta2='eza -lTag --level=2 --icons'
alias lta3='eza -lTag --level=3 --icons'
alias cd='z'

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':completion:*:git-stash:*' sort true
zstyle ':completion:*' special-dirs true
zstyle ':fzf-tab:*' switch-group '<' '>'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Setup starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

export EZA_CONFIG_DIR="$HOME/.config/eza"

# Setup copilot
eval "$(gh copilot alias -- zsh)"
export PATH="$HOME/.local/bin:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=($HOME/.docker/completions $fpath)

autoload -Uz compinit
compinit
# End of Docker CLI completions

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

