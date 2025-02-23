# chizever-config
Dotfiles and setup scripts for my terminal experience. Settings for bash, tmux, Neovim, and whatever else.


# installation
from anywhere:
```bash
curl -o loader.sh https://raw.githubusercontent.com/jeffreychizever/chizever-config/refs/heads/main/loader.sh \
    && chmod +x loader.sh \
    && ./loader.sh
```

# key bindings
just `ag keymap`
Some default values are explicitly remarked here, for reference:
```
keymap TAB: window prefix
keymap \: leader
keymap |: local leader
keymap K: hover(), shows method signature
keymap gc: comment out block (language-aware)
keymap gq: format block (language aware)
keymap *: search for token under cursor in current file
```

