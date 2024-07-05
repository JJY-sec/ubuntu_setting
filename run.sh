sudo sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
sudo apt update
sudo apt install git curl python3 python3-pip  build-essential neovim ripgrep universal-ctags zsh -y  
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

