# bash settings
export HISTSIZE=1048576
export HISTFILESIZE=1048576

# square brackets around escape codes tell bash they're non-printable, so it knows they don't take up space
# otherwise when you scroll through history, the first few characters of the command will not redraw
export PS1='\[\e[34m\]$(dirs): \[\e[0m\]'

# TODO apt update, apt upgrade, with prompt and cleanup
# TODO auto-update configs too


# various
alias v=nvim
alias notes="v ~/notes"
alias todo="(cd ~ && ag TODO)"
alias web="xdg-open https://google.com"

# directories
alias cdws="cd ~/workspace"
alias cdah="cd ~/adhoc"

# config interactions
alias cdc="cd ~/workspace/chizever-config"
rcr() {
  . ~/.bashrc
  tmux source-file ~/.tmux.conf
}

# simple webserver in a directory
serve() {
  python3 -m http.server 8080 &
  xdg-open http://0.0.0.0:8080/
  fg
}

#tmux 
alias tm="tmux new -A -s main"
alias tmr="tmux source-file ~/.tmux.conf"


# git aliases
alias gas="git add --all"
alias can="git commit --amend --no-edit"
alias gl="git log --oneline --graph --all --decorate"
alias gb="git branch --show-current"
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
