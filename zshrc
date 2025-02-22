# bash settings
export HISTSIZE=1048576
export HISTFILESIZE=1048576

source ~/.gruvbox.zsh
source ~/workspace/chizever-config/p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

eval "$(~/.local/bin/mise activate bash)"

# various
export PATH="/opt/nvim-linux-x86_64/bin:$PATH"
export JAVA_HOME=$(cat ~/.java_home)
export PATH="$JAVA_HOME/bin:$PATH"
alias v=nvim
alias ls="ls --color=auto"
alias grep="grep --color"
alias notes="v ~/notes"
alias todo="(cd ~ && ag TODO)"
alias ct="ctags -R --exclude=.git --exclude=log --exclude=html --exclude=build *"
alias subdirs="find . -mindepth 1 -maxdepth 1 -type d"
alias ts='date -u +"%Y-%m-%dT%H:%M:%SZ"'
rc() {
    ( 
        set -euo pipefail
        for dir in $(subdirs)
        do
            cd $dir
            pwd
            "$@"
            cd ..
        done
    )
}
alias ding='echo -e "\a"'
and() {
    test $? -eq 0 && "$@"
}
or() {
    test $? -eq 0 || "$@"
}

web() {
    xdg-open "${1:-https://www.google.com}"
}

# directories
alias cdws="cd ~/workspace"
alias cdah="cd ~/adhoc"

# config interactions
alias cdc="cd ~/workspace/chizever-config"
rcr() {
  . ~/.zshrc
  tmux source-file ~/.tmux.conf
}

# simple webserver in a directory
serve() {
  python3 -m http.server 8080 &
  web http://0.0.0.0:8080/
  fg
}

#tmux 
alias tm="tmux new -A -s main"
alias tmr="tmux source-file ~/.tmux.conf"


# git aliases
alias gas="git add --all"
alias can="git commit --amend --no-edit"
alias gl="git log --oneline --graph --all --decorate"
alias gb="git branch --show-current 2>/dev/null"
alias gr='git remote show origin | grep "$(gb) merges with remote" | awk '"'"'{print $NF}'"'"
alias uncan="git reset HEAD^1"
alias trashcan="git reset --hard HEAD^1"
alias status='git log --oneline HEAD..origin/$(gr) && git status'
alias gascan="gas && can"

sing() {
	cat <<EOF
Daisy, Daisy,
Give me your answer, do!
I'm half crazy,
All for the love of you!
It won't be a stylish marriage,
I can't afford a carriage,
But you'll look sweet upon the seat
Of a bicycle built for two!
EOF
}


if [[ $(hostname) = "penguin" ]]
then
    alias sheets="web https://docs.google.com/spreadsheets/u/0/"
    alias docs="web https://docs.google.com/"
    alias notes="web https://keep.google.com/#NOTE/12tsHEzsQPpI6o8e2FhjWWlcoi4bRq1hI_d-Vwg0cw6GZXOCK3sW1h76kwvgkW_90Kn4U"
fi


# https://ianyepan.github.io/posts/moving-away-from-ohmyzsh/
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
