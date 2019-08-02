alias cls="clear"
#alias ls="ls -laF"
#alias ls="ls -lah"
#alias ls="lsd -lahF"
# Save me from myself (needs `sudo apt-get install trash-cli`)
#alias rm="trash"

alias gs="git status"
alias proj="cd ~/Projects"
alias tns="tmux new-session -s"
alias connido="cd ~/Projects/connido"
alias ct="ctags -R -f ./.git/tags --exclude=node_modules --exclude=bower_components --exclude=dist --exclude=build"
alias mkdir='mkdir -p'
alias du='du -h'
alias zshreload="source ~/.zshrc"

alias tls="tmux ls"
alias tat="tmux attach -t"
alias tks="tmux kill-session -t"
alias rg='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias open="xdg-open"
#alias python=python3
#alias vim=nvim
alias nvime="vim ~/.config/nvim/init.vim"

alias ls="exa --long --header --git"
