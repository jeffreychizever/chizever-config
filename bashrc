# bash settings
# TODO fix weird output when moving up twice
export HISTSIZE=1048576
export HISTFILESIZE=1048576
export PS1='\e[34m$(dirs): \e[0m'

# TODO apt update, apt upgrade, with prompt and cleanup
# TODO auto-update configs too

# TODO todo-lister
# TODO ag

# directories
alias cdws="cd ~/workspace"
alias cdah="cd ~/adhoc"

# config interactions
alias cdc="cd ~/workspace/chizever-config"
rcr() {
  . ~/.bshrc
  tmux source-file ~/.tmux.conf
}

# editor
alias v=nvim
alias notes="v ~/notes"

# simple webserver in a directory
serve() {
  pass
  # TODO
}

#tmux 
alias tm="tmux new -A -s main"
alias tmr="tmux source-file ~/.tmux.conf"
# TODO tmux default window

# TODO easy systemd?
# TODO easy cached menus?

# git aliases
alias gas="git add --all"
alias can="git commit --amend --no-edit"
alias gl="git log --oneline --graph --all --decorate"
alias uncan="git reset HEAD^1"
alias trashcan="git reset --hard HEAD^1"
alias status="git log --oneline HEAD..origin/mainline && git status"
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
