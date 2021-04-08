XDG_CONFIG_HOME?=~/.config
CONFIGFILES=$(wildcard config/*)
CONFIG=$(subst config/,$(XDG_CONFIG_HOME)/,$(CONFIGFILES))
HOMEFILES=$(wildcard home/*)
HOMES=$(subst home/,~/.,$(HOMEFILES))

.PHONY: default install-brew homebrew update-apt apt yum npm clean

.DEFAULT: default

default: .gitsubmodulesinstalled ~/.dotfiles $(CONFIG) $(HOMES) $(XDG_DATA_HOME)/nvim/site/autoload/plug.vim

clean:
	-rm $(HOMES)
	-rm -rf $(CONFIG)
	-rm .gitsubmodulesinstalled

.gitsubmodulesinstalled:
	git submodule update --init
	touch $@

~/.dotfiles:
	ln -s $(PWD)/ $@

$(XDG_CONFIG_HOME): 
	mkdir $(XDG_CONFIG_HOME)

# Automatic files

$(XDG_CONFIG_HOME)/%/: config/% $(XDG_CONFIG_HOME)
	cp -R $(PWD)/$</ $@

~/.%: home/%
	cp $(PWD)/$< $@

$(XDG_DATA_HOME)/nvim/site/autoload/plug.vim:
	./install-vimplug.sh

# Package Managers

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
	sudo apt-get install awk
	sudo apt-get install cowsay
	sudo apt-get install fd-find
	sudo apt-get install figlet
	sudo apt-get install neovim
	sudo apt-get install node
	sudo apt-get install silversearcher-ag
	sudo apt-get install tmux
	sudo apt-get install kitty
	sudo apt-get install fd-find
	sudo apt-get install fzf

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

npm: 
	which npm > /dev/null && npm install -g eslint
	which npm > /dev/null && npm install -g typescript
	which npm > /dev/null && npm install -g ts-node
	which npm > /dev/null && npm install -g @types/node
	which npm > /dev/null && npm install -g typescript-eslint
	which npm > /dev/null && npm install -g pm2

