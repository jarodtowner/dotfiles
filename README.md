# Dotfiles 📁

Version-controlled configuration files for my personal computers.

There is a vim-friendly Table of Contents in (|toc|)[./toc.txt]. It uses vim tags.

## Installation

```zsh
# Download the repo

git clone https://github.com/ashleytowner/dotfiles 
cd dotfiles
make
```

## Special Directories

### Config

Everything in the `config/` directory gets copied to `~/.config`. Everything in this directory *must* be a folder.

### Home

Everything in the `home/` directory gets copied to `~/` with a dot prepended to it. Everything in this directory must be a file.

## Local Overriding

Sometimes you may want to have some specific overrides on each machine that you don't want to commit to the central repo. To do this, you can use local override files which will be loaded at the end of various dotfiles. Below is a list of the currently configured override files: 

| Program | Local Override File             |
| :-----: | :------------------------------ |
|   zsh   | `~/.config/zsh/zshrc_local`     |
|   git   | `~/.config/git/gitconfig_local` |
|  nvim   | `~/.config/nvim/init_local.vim` |
|  tmux   | `~/.tmux_local.conf`            |
