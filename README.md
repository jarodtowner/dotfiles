# Dotfiles

Within are my configuration files for zsh, neovim, tmux and some other things. I use dotbot to create an easy-to-manage install script. 

## Installation
```bash
# One Line Installation

curl https://raw.githubusercontent.com/jarodtowner/dotfiles/main/remote-install.zsh | zsh && source ~/.zshrc

# Manual Install

git clone https://github.com/jarodtowner/dotfiles 
cd dotfiles
./install
source ~/.zshrc
```

## Local Overriding

Sometimes you may want to have some specific overrides on each machine that you don't want to commit ot the central repo. To do this, you can use local override files which will be loaded at the end of various dotfiles. Below is a list of the currently configured override files: 

| Program | Local Override File |
| :-----: | :------------------ |
|   zsh   |   `~/.zshrc_local`  |
|   git   | `~/.gitconfig_local`|
|  nvim   |  `~/.nvimrc_local`  |
|  tmux   | `~/.tmux_local.conf`|
