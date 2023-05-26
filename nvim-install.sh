if [[ "$OSTYPE" == "linux-gnu"* ]]; then
       command -v nvim > /dev/null || sudo apt-get update && sudo apt-get install -y neovim universal-ctags
       command -v node > /dev/null || curl -sL install-node.now.sh/lts | sudo bash
elif [[ "$OSTYPE" == "darwin"* ]]; then
       command -v nvim > /dev/null || brew install nvim universal-ctags
       command -v nvim > /dev/null || brew install node
else
       echo "$OSTYPE Not Supported OS"
       exit 1
fi

if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]; then
       curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
              https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
       echo "vim-plug, skip"
fi

mkdir -p ~/.config/nvim

if [ -f "$HOME/.config/nvim/init.vim" ]; then
       echo "$HOME/.config/nvim/init.vim is exist, skip"
else
       cp config/nvim/init.vim "$HOME/.config/nvim/init.vim"
fi
if [ -f "$HOME/.config/nvim/coc-settings.json" ]; then
       echo "$HOME/.cconfig/nvim/coc-settings.json  is exist, skip"
else
       cp config/nvim/coc-settings.json "$HOME/.config/nvim/coc-settings.json"
fi

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
