# General
alias please='sudo $(history -p !!)'
alias pls="please"
mkcd () { mkdir ${1} && cd ${1}; }
alias clean="bleachbit --preset"

# Networking
alias myip="curl -s http://ipecho.net/plain"

# Git
alias review="git log --oneline --decorate --graph --all"
