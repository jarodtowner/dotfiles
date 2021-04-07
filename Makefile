~/.dotfiles: submodules
	ln -s $(PWD) ~/.dotfiles

macos: ~/.dotfiles links homebrew npm 
	@echo MacOS installation complete.

kali: ~/.dotfiles links apt npm
	@echo Kali Linux installation complete.

submodules:
	git submodule update --init

npm: 
	which npm > /dev/null && npm install -g eslint
	which npm > /dev/null && npm install -g typescript
	which npm > /dev/null && npm install -g ts-node
	which npm > /dev/null && npm install -g @types/node
	which npm > /dev/null && npm install -g typescript-eslint
	which npm > /dev/null && npm install -g pm2

links: ~/.zshrc ~/.tmux.conf ~/.bashrc ~/.gitconfig ~/.ideavimrc $(XDG_CONFIG_HOME)/nvim $(XDG_CONFIG_HOME)/taskwarrior $(XDG_CONFIG_HOME)/git/gitconfig_local $(XDG_CONFIG_HOME)/kitty

$(XDG_CONFIG_HOME): 
	mkdir $(XDG_CONFIG_HOME)

~/.zshrc: zsh/zshrc 
	ln -s $(PWD)/$< $@
	source $<

~/.tmux.conf: home/tmux.conf 
	rm $@
	ln -s $(PWD)/$< $@

~/.bashrc: home/bashrc 
	rm $@
	ln -s $(PWD)/$< $@

~/.gitconfig: home/gitconfig
	rm $@
	ln -s $(PWD)/$< $@

~/.ideavimrc: home/ideavimrc
	rm $@
	ln -s $(PWD)/$< $@

$(XDG_CONFIG_HOME)/nvim: config/nvim $(XDG_DATA_HOME)/nvim/site/autoload/plug.vim
	rm $@
	ln -s $(PWD)/$< $@

$(XDG_DATA_HOME)/nvim/site/autoload/plug.vim:
	./install-vimplug.sh

$(XDG_CONFIG_HOME)/taskwarrior: config/taskwarrior $(XDG_CONFIG_HOME)
	rm $@
	ln -s $(PWD)/$< $@

$(XDG_CONFIG_HOME)/kitty: config/kitty $(XDG_CONFIG_HOME)
	rm $@
	ln -s $(PWD)/$< $@

$(XDG_CONFIG_HOME)/git/gitconfig_local: config/git/gitconfig_local $(XDG_CONFIG_HOME) 
	[ -f $@ ] || cp $< $@

install-brew:
	which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

homebrew: install-brew
	brew list awk > /dev/null || brew install awk
	brew list ccls > /dev/null || brew install ccls
	brew list cowsay > /dev/null || brew install cowsay
	brew list ctags > /dev/null || brew install ctags
	brew list ctags > /dev/null || brew install ctags
	brew list fd > /dev/null || brew install fd
	brew list figlet > /dev/null || brew install figlet
	brew list jq > /dev/null || brew install jq
	brew list lolcat > /dev/null || brew install lolcat
	brew list neovim > /dev/null || brew install neovim
	brew list node > /dev/null || brew install node
	brew list python3 > /dev/null || brew install python3
	brew list ripgrep > /dev/null || brew install ripgrep
	brew list ruby > /dev/null || brew install ruby
	brew list shpotify > /dev/null || brew install shpotify
	brew list telnet > /dev/null || brew install telnet
	brew list the_silver_searcher > /dev/null || brew install the_silver_searcher
	brew list tmux > /dev/null || brew install tmux
	brew list yarn > /dev/null || brew install yarn
	brew list youtube-dl > /dev/null || brew install youtube-dl
	brew list basictex > /dev/null || brew install basictex
	brew list kitty > /dev/null || brew install kitty

update-apt:
	apt-get update

apt: update-apt
	apt-get install awk
	apt-get install cowsay
	apt-get install fd-find
	apt-get install figlet
	apt-get install neovim
	apt-get install node
	apt-get install silversearcher-ag
	apt-get install tmux
	apt-get install kitty
	apt-get install fd-find
	apt-get install fzf

yum:
	yum install -y -s awk
	yum install -y -s cowsay
	yum install -y -s ctags
	yum install -y -s figlet
	yum install -y -s fortune
	yum install -y -s jq
	yum install -y -s neovim
	yum install -y -s node
	yum install -y -s tmux
