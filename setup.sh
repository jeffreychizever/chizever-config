set -euo pipefail

# get packages
sudo apt-get install -y tmux neovim gh

# make directories
mkdir -p ~/workspace ~/adhoc ~/.config/nvim

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

# TODO plug in tmux.conf nvim.conf vimrc bashrc muttrc

echo -e "Setup successful! Ride fast and take chances \xF0\x9F\x8F\x8E"
