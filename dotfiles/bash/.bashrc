# Configuracion personalizada

[[ $- != *i* ]] && return

alias cls='clear'
alias update='sudo pacman -Syu'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'

PS1='[\u@\h \w]\$ '

export PATH="$HOME/.local/bin:$PATH"
