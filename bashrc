# My bash config

# Export
export TERM="xterm-256color" # Enable 256 color support

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History settings
HISTCONTROL=ignoreboth    # Ignore duplicates and lines starting with space
shopt -s histappend       # Append to history file instead of overwriting
HISTSIZE=1000            # Commands stored in memory during session
HISTFILESIZE=2000        # Commands stored in history file

# Auto-update terminal dimensions when window is resized
shopt -s checkwinsize

# Use nvim for reading man pages
export MANPAGER='nvim +Man!'

# Enable FZF fuzzy finder keybindings if available
if command -v fzf &> /dev/null; then
    eval "$(fzf --bash)"
fi

# Enable colored output for ls and grep commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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
alias free='free -h'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gd='git diff'

# Source separate aliases file if it exists
# This allows keeping project-specific or machine-specific aliases separate from this main config
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features for better tab completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Enable starship
eval "$(starship init bash)"
