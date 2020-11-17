# neovim
brew install neovim
mv ~/.vimrc ~/.vimrc.old # Make a backup of the current .vimrc
mv ~/.nvimrc ~/.nvimrc.old
rm ~/.vimrc # Remove the old .vimrc
rm ~/.nvimrc
ln ../vim/.vimrc ~/.vimrc # Make a link between the .vimrc in this directory and the home directory
mkdir ~/.config/nvim
ln ../vim/nvimrc ~/.config/nvim/init.vim
# Install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
