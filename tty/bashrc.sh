# ~/.bashrc - minimalism

# Exit if not running interactively
[[ $- != *i* ]] && return

# Set TTY font 
setfont tec-132n

# Prompts
PS1='> '
PS2='→ '

# Set default editor
export EDITOR=emacs

# Enable color support for ls and add useful aliases
if command -v dircolors &>/dev/null; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Common aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias h='history'
alias e='emacs'  
alias v='nvim'
alias df='df -h'
alias du='du -h'
alias cp='cp -iv'  # Interactive copy (asks before overwriting)
alias mv='mv -iv'  # Interactive move
alias rm='rm -iv'  # Interactive delete
alias mkdir='mkdir -pv'  # Create parent directories as needed
alias grep='grep --color=auto'
alias x='exit'  # Quick exit

# Networking aliases
alias lswifi='nmcli device wifi list'
alias connectwifi='nmcli device wifi connect'

# System monitoring aliases
alias mem='free -h'  # Check memory usage
alias cpu='lscpu'  # Show CPU details
alias myip='curl ifconfig.me'  # Get public IP

# Power management aliases
alias reboot='sudo reboot'
alias shutdown='sudo shutdown -h now'

# Add local bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Improve Bash history behavior
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend cmdhist
export PROMPT_COMMAND="history -a; history -c; history -r"

# Enable globstar for recursive globbing (**)
shopt -s globstar

# Enable automatic 'cd' (typing a directory name changes to it)
shopt -s autocd

# Faster directory navigation (jump to previous dir)
alias -- -='cd -'

# Less colors for better readability in man pages
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;37m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'
export LESS_TERMCAP_ue=$'\e[0m'

# Enable bash completion if available
[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Source additional configurations if present
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_functions ] && source ~/.bash_functions
[ -f ~/.bash_env ] && source ~/.bash_env

clear
neofetch
