sudo sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
sudo apt update
sudo apt install git curl python3 python3-pip  build-essential dnf ripgrep universal-ctags zsh neovim clangd  -y
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
curl -sL install-node.now.sh/lts | sudo $SHELL


mkdir ~/.config/nvim -p 
touch ~/.config/nvim/init.vim

cat << EOF > ~/.config/nvim/init.vim
" Start Plug-In (Plug-in installation path)
call plug#begin('~/.vim/plugged')

" Plugin you want to install (e.g. NERDTree)
Plug 'preservim/nerdtree'

" Initialize the plug-in system
call plug#end()

" Below is your nvim settings.
set nu
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

EOF
nvim +PlugInstall +qall
nvim +'CocInstall coc-clangd' +qall


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

