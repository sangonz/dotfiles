# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH theme
ZSH_CUSTOM="$HOME/.dotfiles/config/zsh"  # Default $ZSH/custom
ZSH_THEME="sgz"

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS=true  # Uncomment id pasting URLs and stuff is messed up.
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true" # Auto terminal title
# ENABLE_CORRECTION="true"  # Command auto-correction
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Language environment
# export LANG=en_US.UTF-8

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

if [[ $(which exa) ]]; then
    alias ll='exa -l'
    alias lsa='exa -la'
fi
alias v='nvim'
alias r='ranger'
alias t='tmux a || tmux'
alias ip='ip --color'

mk() {mkdir -p $1; cd $1}

export CHEAT_CONFIG_PATH="~/.dotfiles/cheat/conf.yml"
export EDITOR='nvim'
export PATH="/snap/bin:$HOME/.dotfiles/bin:$HOME/.cargo/bin:$HOME/go/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH_CUSTOM/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

