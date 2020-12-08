if [ ! $(command -v brew) ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
# Install packages
type "tmux" &> /dev/null || brew install tmux
type "nvim" &> /dev/null || brew install neovim
type "ag" &> /dev/null || brew install the_silver_searcher
type "node" &> /dev/null || brew install node
type "cowsay" &> /dev/null || brew install cowsay
type "python3" &> /dev/null || brew install python3
type "fd" &> /dev/null || brew install fd
type "ruby" &> /dev/null || brew install ruby
type "az" &> /dev/null || brew install azure-cli
type "yarn" &> /dev/null || brew install yarn
