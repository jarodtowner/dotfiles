$PACKAGES = (
  "neovim"
  "tmux"
  "cowsay"
  "node"
  "jq"
  "figlet"
  "fortune"
)

for p in $PACKAGES; do
  yum list $p &> /dev/null || yum install $p
done
