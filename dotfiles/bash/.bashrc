# Configuracion personalizada

[[ $- != *i* ]] && return

alias cls='clear'
alias update='sudo pacman -Syu'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='[\u@\h \w]\$'

eval "$(dircolors -b)"

export LS_COLORS="$LS_COLORS:di=0:"
export PATH="$HOME/.local/bin:$PATH"

