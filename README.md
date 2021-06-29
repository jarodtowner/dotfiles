# Dotfiles 📁

Version-controlled configuration files for my personal computers.

## Installation

```zsh
# Download the repo

git clone https://github.com/ashleytowner/dotfiles 
cd dotfiles

# Run the install script
chmod +x install.sh
./install.sh
```

## Stow

This uses stow to manage the locations of config files.

## Local Overriding

Sometimes you may want to have some specific overrides on each machine that you don't want to commit to the central repo. To do this, you can use local override files which will be loaded at the end of various dotfiles. Below is a list of the currently configured override files: 

| Program | Local Override File             |
| :-----: | :------------------------------ |
|   zsh   | `~/.config/zsh/zshrc_local`     |
|   git   | `~/.config/git/gitconfig_local` |
|  nvim   | `~/.config/nvim/init_local.vim` |
|  tmux   | `~/.tmux_local.conf`            |
