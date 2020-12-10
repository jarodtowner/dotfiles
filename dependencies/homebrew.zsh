if [ ! $(command -v brew) ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi


PACKAGES=(
  "tmux"
  "neovim"
  "the_silver_searcher"
  "node"
  "cowsay"
  "python3"
  "fd"
  "ruby"
  "yarn"
  "jq"
  "ripgrep"
  "ccls"
  "telnet"
)

for p in $PACKAGES; do
  brew list $p &> /dev/null || brew install $p
done
