if [ ! $(command -v brew) ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
# Install packages
brew install tmux
brew install neovim
brew install the_silver_searcher
brew install node
brew install cowsay
