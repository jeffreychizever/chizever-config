#!/bin/bash
set -euo pipefail

# get packages
sudo apt-get install -y tmux neovim gh silversearcher-ag

# make directories
mkdir -p ~/workspace ~/adhoc ~/.config/nvim

# TODO abstract feature selector
if ! (test -f ~/.config/features && grep -q "github" ~/.config/features)
then
    echo "Log in to GitHub?"
    select answer in yes no
    do
        if [[ $answer = "no" ]]
        then
        echo "github false" > ~/.config/features
        break
        fi
        if [[ $answer = "yes" ]]
        then
        echo "github true" > ~/.config/features
        break
        fi
    done
fi

if grep -q "github true" ~/.config/features
then
    gh auth status || (gh auth login && gh auth status)
fi

# TODO prompt for which of these to install
grep -q "chizever-config" ~/.tmux.conf || echo "source ~/workspace/chizever-config/tmux.conf" >> ~/.tmux.conf
grep -q "chizever-config" ~/.bashrc || echo "source ~/workspace/chizever-config/bashrc" >> ~/.bashrc
grep -q "chizever-config" ~/.vimrc || echo "source ~/workspace/chizever-config/vimrc" >> ~/.vimrc
grep -q "chizever-config" ~/.config/nvim/init.vim || echo "source ~/workspace/chizever-config/init.vim" >> ~/.config/nvim/init.vim

echo -e "Setup successful! Ride fast and take chances \xF0\x9F\x8F\x8E"
