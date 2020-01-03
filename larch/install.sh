#!/bin/sh

CONFIG_DIR=~/.config

redshift()
{
	cp redshift.config ${CONFIG_DIR}/redshift.conf
}

nvim()
{
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp init.vim ${CONFIG_DIR}/nvim/init.vim
	cp nvim/colors/* ${CONFIG_DIR}/nvim/colors/
}

rofi()
{
	git clone https://github.com/bardisty/gruvbox-rofi.git \
		${CONFIG_DIR}/rofi/themes/gruvbox
	echo "rofi.theme: ~/.config/rofi/themes/gruvbox/gruvbox-dark-soft.rasi" \
		> ${CONFIG_DIR}/rofi/config
}

gdb()
{
	yay -S pwndbg
	cp .gdbinit ${HOME}/.gdbinit
}

main()
{
	redshift()
	nvim()
	rofi()
#	gdb()
}

