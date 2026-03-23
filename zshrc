# My zsh config
# for compatibility with Clash Verge Rev proxy and port 7897

# HTTP proxy for tools that require HTTP (Claude Code, npm etc.)
export https_proxy=http://127.0.0.1:7897
export http_proxy=http://127.0.0.1:7897

# SOCKS5 for tools that support it
export all_proxy=socks5://127.0.0.1:7897

# upper case versions
export HTTPS_PROXY=http://127.0.0.1:7897
export HTTP_PROXY=http://127.0.0.1:7897
export ALL_PROXY=socks5://127.0.0.1:7897

# for claude code
export PATH="$HOME/.local/bin:$PATH"

# Export
export TERM="xterm-256color" # Enable 256 color support

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Homebrew (Apple Silicon)
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=1000            # Commands stored in memory during session
SAVEHIST=2000            # Commands stored in history file
setopt HIST_IGNORE_DUPS  # Ignore duplicate commands
setopt HIST_IGNORE_SPACE # Ignore lines starting with space
setopt APPEND_HISTORY    # Append to history file instead of overwriting

# Use nvim for reading man pages
export MANPAGER='nvim +Man!'

# Enable FZF fuzzy finder keybindings if available
if command -v fzf &> /dev/null; then
    eval "$(fzf --zsh)"
fi

# Enable colored output for ls and grep commands (macOS)
export CLICOLOR=1
alias ls='ls -G'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Navigation aliases
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Directory listing aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Other useful aliases
alias h='history'
alias c='clear'
alias df='df -h'
alias du='du -h'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gd='git diff'

# Source separate aliases file if it exists
# This allows keeping project-specific or machine-specific aliases separate from this main config
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# Enable zsh completion
autoload -Uz compinit && compinit

# Enable starship
eval "$(starship init zsh)"
