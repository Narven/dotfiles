alias cls="clear"
#alias ls="ls -laF"
#alias ll="ls -lah"
#alias ls="lsd -lahF"
# Save me from myself (needs `sudo apt-get install trash-cli`)
#alias rm="trash"

alias docker="sudo docker"
alias gp="git pull"
alias gs="git status"
alias gc="git commit"
alias gcm="git commit -m"
alias proj="cd ~/Projects"
alias pull="git pull"
alias push="git push"
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
alias python=python3
#alias vim=nvim
alias nvime="nvim ~/.config/nvim/init.vim"

