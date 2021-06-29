#!/bin/zsh

if [ $(uname -s) = 'MacOS' ]; then
  which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages
which brew > /dev/null && brew bundle
which apt > /dev/null && xargs sudo apt install <Aptfile

# Install submodules
git submodule update --init

# Install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Stow everything that needs stowing
stow bash
stow ctags
stow fzf
stow git
stow kitty
stow nvim
stow taskwarrior
stow tmux
stow zsh

