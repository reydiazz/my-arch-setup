# Configuracion personalizada

[[ $- != *i* ]] && return

alias cls='clear'
alias update='sudo pacman -Syu'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias endx='bspc quit'

PS1='[\u@\h \w]\$'

eval "$(dircolors -b)"

export PATH="$HOME/.local/bin:$PATH"

