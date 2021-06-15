sudo apt-get update && sudo apt-get install -y neovim universal-ctags

curl -sL install-node.now.sh/lts | sudo bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.vim
mkdir -p ~/.config/nvim

cp config/nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/coc
cp config/coc/coc-settings.json ~/.config/coc/coc-settings.json

echo "Done"

echo "Run next commands"
echo ":CocInstall coc-ccls"
echo ":CocInstall coc-go"
echo ":CocInstall coc-python"
nvim +PlugInstall
