#!/bin/bash

#PACKAGES=(curl cmake gdb git neovim bison flex python3 wget npm);
PACKAGES_APT=(libssl-dev libffi-dev build-essential);
PKG_PYTHON=(jedi z3-solver);
PKG_INSTALL="sudo apt install ";
PKG="apt";
[[ $1 == "arch" ]] && PKG_INSTALL="sudo pacman -S " && PKG="pacman";
$PKG_INSTALL ${PACKAGES[*]};
[[ "$PKG" == "apt" ]] && ${PKG_INSTALL} ${PACKAGES_APT[*]};

mkdir -p ~/Tools;

radare2() {
    echo "[*] installing radare2"
    git clone https://github.com/radareorg/radare2.git ~/Tools/radare2;
    cd ~/Tools/radare2;
    sys/install.sh;
    echo "eco ayu" > ~/.radare2rc
    r2pm init;
    r2pm -i r2ghidra-dec;
}

pwndbg() {
    echo "[*] installing pwndbg"
    git clone https://github.com/pwndbg/pwndbg ~/Tools/pwndbg;
    cd ~/Tools/pwndbg;
    ./setup.sh;
}

dotfiles() {
    echo "[*] installing dotfiles"
    git clone https://github.com/meowmeowxw/dotfiles ~/Tools/dotfiles;
}

neovim() {
    echo "[*] installing neovim"
    mkdir -p ~/.config/nvim/
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    cp ~/Tools/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
}

pwntools() {
    echo "[*] installing pwntools"
    python3 -m pip install --upgrade pip
    python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev
}

python() {
    echo "[*] installing python3 useful libraries"
    python3 -m pip install --upgrade pip
    python3 -m pip install --user ${PKG_PYTHON[*]}
}

radare2;
pwndbg;
dotfiles;
neovim;
