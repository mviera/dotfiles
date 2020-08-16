# custom aliases
alias llart='ls -lart'
alias tmux="tmux -2"

# local aliases
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi
