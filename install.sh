#!/bin/bash

PACKAGES=(curl cmake gdb git neovim bison flex python3 wget npm);
PKG_INSTALL="sudo apt install ";
PKG="apt"
[[ $1 == "arch" ]] && PKG_INSTALL="sudo pacman -S " && PKG="pacman";

mkdir -p ~/Tools;

radare2() {
    git clone https://github.com/radareorg/radare2.git ~/Tools/radare2;
    cd ~/Tools/radare2;
    sys/install.sh;
    echo "eco ayu" > ~/.radare2rc
    r2pm init;
    r2pm -i r2ghidra-dec;
}

pwndbg() {
    git clone https://github.com/pwndbg/pwndbg ~/Tools/pwndbg;
    cd ~/Tools/pwndbg;
    ./setup.sh;
}

dotfiles() {
    git clone https://github.com/meowmeowxw/dotfiles ~/Tools/dotfiles;
}

neovim() {
    mkdir -p ~/.config/nvim/
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    cp ~/Tools/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
}

radare2;
pwndbg;
dotfiles;
neovim;
