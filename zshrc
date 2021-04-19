# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH theme
ZSH_CUSTOM="$HOME/.dotfiles/config/zsh"  # Default $ZSH/custom
ZSH_THEME="sgz"

# ZSH_THEME="powerlevel10k/powerlevel10k"

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
# HIST_STAMPS="mm/dd/yyyy"  # Change default timestamp in history file

# Standard plugins $ZSH/plugins/
# Custom plugins $ZSH_CUSTOM/plugins/
plugins=(git wp-cli zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
#
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias v='nvim'
alias r='ranger'
alias bat='batcat'
alias fd='fdfind'


[[ $(which notify-send) ]] && alias tnot='notify-send "Terminal notification"'

if [[ $(which exa) ]]; then
  alias ls='exa'
  alias ll='exa -l'
  alias la='exa -la'
fi

# ProtonVPN
alias pc='sudo protonvpn connect --fastest'
alias pd='sudo protonvpn disconnect'
alias pr='sudo protonvpn reconnect'

function mkcd {
  mkdir $1
  cd $1
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Disable bell on tab completion
unsetopt BEEP

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

export TERMINAL='kitty'

# Exiting ranger with Q, returns to cd in the directory
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# Lineage OS
# export PATH="$HOME/Software/lineage/adb-fastboot/platform-tools:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

