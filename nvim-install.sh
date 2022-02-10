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
echo "run nvim"
echo ":PlugInstall"
nvim --headless +PlugInstall +qall
# echo ":CocInstall coc-ccls"
# nvim --headless +'CocInstall -sync coc-ccls' +qall
echo ":CocInstall coc-go"
nvim --headless +'CocInstall -sync coc-go' +qall
echo ":CocInstall coc-python"
nvim --headless +'CocInstall -sync coc-python' +qall
echo ":CocUpdateSync"
nvim --headless +'CocUpdateSync' +qall
