XDG_CONFIG_HOME?=~/.config

.PHONY: default install-brew homebrew update-apt apt yum npm clean

.DEFAULT: default

default: .gitsubmodulesinstalled ~/.dotfiles 

clean:
	-rm .gitsubmodulesinstalled

.gitsubmodulesinstalled:
	git submodule update --init
	touch $@

~/.dotfiles:
	ln -s $(PWD)/ $@

$(XDG_CONFIG_HOME): 
	mkdir $(XDG_CONFIG_HOME)

# Package Managers

/usr/local/bin/brew:
	which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

homebrew: /usr/local/bin/brew Brewfile
	brew bundle

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
	which npm > /dev/null && npm install -g graphql-language-service-cli

