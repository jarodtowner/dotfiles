macos: common homebrew

common: links
	which node && zsh ./packages/npm.sh || true

links: ~/.zshrc ~/.tmux.conf ~/.bashrc ~/.gitconfig ~/.ideavimrc $(XDG_CONFIG_HOME)/nvim/init.vim $(XDG_CONFIG_HOME)/nvim/coc-settings.json $(XDG_CONFIG_HOME)/nvim/site/autoload/plug.vim $(XDG_CONFIG_HOME)/taskwarrior/taskrc 

~/.zshrc: zsh/zshrc
	ln -s $(PWD)/$< $@
	source $<

~/.tmux.conf: tmux/tmux.conf
	ln -s $(PWD)/$< $@

~/.bashrc: bash/bashrc
	ln -s $(PWD)/$< $@

~/.gitconfig: git/gitconfig
	ln -s $(PWD)/$< $@

$(XDG_CONFIG_HOME)/nvim/init.vim: nvim/init.vim
	ln -s $(PWD)/$< $@

~/.ideavimrc: nvim/init.vim
	ln -s $(PWD)/$< $@

$(XDG_CONFIG_HOME)/nvim/coc-settings.json: nvim/coc-settings.json
	ln -s $(PWD)/$< $@

$(XDG_CONFIG_HOME)/nvim/site/autoload/plug.vim: nvim/vim-plug/plug.vim
	ln -s $(PWD)/$< $@

$(XDG_CONFIG_HOME)/taskwarrior/taskrc: taskwarrior/taskrc
	ln -s $(PWD)/$< $@

$(XDG_CONFIG_HOME)/git/gitconfig_local: 
	echo > $@

homebrew: install-brew
	brew list tmux > /dev/null || brew install tmux
	brew list neovim > /dev/null || brew install neovim
	brew list the_silver_searcher > /dev/null || brew install the_silver_searcher
	brew list node > /dev/null || brew install node
	brew list cowsay > /dev/null || brew install cowsay
	brew list python3 > /dev/null || brew install python3
	brew list fd > /dev/null || brew install fd
	brew list ruby > /dev/null || brew install ruby
	brew list yarn > /dev/null || brew install yarn
	brew list jq > /dev/null || brew install jq
	brew list ripgrep > /dev/null || brew install ripgrep
	brew list ccls > /dev/null || brew install ccls
	brew list telnet > /dev/null || brew install telnet
	brew list figlet > /dev/null || brew install figlet
	brew list ctags > /dev/null || brew install ctags
	brew list shpotify > /dev/null || brew install shpotify
	brew list awk > /dev/null || brew install awk
	brew list lolcat > /dev/null || brew install lolcat
	brew list ctags > /dev/null || brew install ctags
	brew list youtube-dl > /dev/null || brew install youtube-dl

install-brew:
	which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

yum:
	yum install -y -s neovim
	yum install -y -s tmux
	yum install -y -s cowsay
	yum install -y -s node
	yum install -y -s jq
	yum install -y -s figlet
	yum install -y -s fortune
	yum install -y -s awk
	yum install -y -s ctags
