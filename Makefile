macos: submodules $(XDG_CONFIG_HOME) links node

$(XDG_CONFIG_HOME): 
	mkdir $(XDG_CONFIG_HOME)

submodules:
	git submodule update --init

node: homebrew
	which node && zsh ./packages/npm.sh || true

links: ~/.zshrc ~/.tmux.conf ~/.bashrc ~/.gitconfig $(XDG_CONFIG_HOME)/nvim/init.vim $(XDG_CONFIG_HOME)/nvim/coc-settings.json $(XDG_CONFIG_HOME)/nvim/site/autoload/plug.vim $(XDG_CONFIG_HOME)/taskwarrior/taskrc 

~/.zshrc: zsh/zshrc 
	ln -s $(PWD)/$< $@
	source $<

~/.tmux.conf: home/tmux.conf 
	ln -s $(PWD)/$< $@

~/.bashrc: home/bashrc 
	ln -s $(PWD)/$< $@

~/.gitconfig: home/gitconfig
	ln -s $(PWD)/$< $@

$(XDG_CONFIG_HOME)/nvim: config/nvim $(XDG_DATA_HOME)/nvim/site/autoload/plug.vim
	ln -s $(PWD)/$< $@

$(XDG_DATA_HOME)/nvim/site/autoload/plug.vim:
	./install-vimplug.sh

$(XDG_CONFIG_HOME)/taskwarrior: config/taskwarrior $(XDG_CONFIG_HOME)
	ln -s $(PWD)/$< $@

$(XDG_CONFIG_HOME)/git/gitconfig_local: $(XDG_CONFIG_HOME) 
	echo > $@

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
