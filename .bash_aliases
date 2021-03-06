alias cls="clear"
alias ls="ls -lahF"
#alias ls="ls -lah"
#alias ls="lsd -lahF"
# Save me from myself (needs `sudo apt-get install trash-cli`)
#alias rm="trash"

alias gs="git status -sb"
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
alias python=python3
alias vim=nvim
alias nvime="vim ~/.config/nvim/init.vim"
alias gh='history|grep'
alias left='ls -t -l'
alias please='sudo'
alias sudi='sudo !!'
alias ll="exa -l -F --all -h --git --color-scale --sort=ext --extended"
alias mux="tmuxinator"
alias gocode="cd ~/go/src/github.com/narven"
alias grm="go run ."
alias gb.="go build ."
alias lp="tmux start-server && tmuxinator start Personal"
alias gobuff="cd ~/Projects/buffup"
alias kb="kubectl"
alias mk="minikube"
alias fontcache="fc-cache -f -v"
alias vdvu="vagrant halt & vagrant destroy -f & vagrant up"
alias vu="vagrant up"
alias vd="vagrant destroy"
alias dang='docker rmi -f $(docker images -f "dangling=true" -q)'
# alias ssh="assh wrapper ssh"
#alias laravel='composer create-project --prefer-dist laravel/laravel'
alias art='php artisan'
alias godot=/opt/Godot_v3.2-stable_x11.64
