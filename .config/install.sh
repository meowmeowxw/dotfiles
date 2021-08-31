#!/bin/sh

CONFIG_DIR=~/.config
START="[*] config"
END="[*] done"

redshift()
{
	echo ${START} "redshift"
	cp redshift.conf ${CONFIG_DIR}/redshift.conf
	echo ${END} "redshift"
}

nvim()
{
	echo ${START} "nvim"
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ${CONFIG_DIR}/nvim/colors
	cp nvim/init.vim ${CONFIG_DIR}/nvim/init.vim
	cp nvim/colors/* ${CONFIG_DIR}/nvim/colors/
	echo ${END} "nvim"
}

rofi()
{
	echo ${START} "rofi"
	git clone https://github.com/bardisty/gruvbox-rofi.git \
		${CONFIG_DIR}/rofi/themes/gruvbox
	echo "rofi.theme: ~/.config/rofi/themes/gruvbox/gruvbox-dark-soft.rasi" \
		> ${CONFIG_DIR}/rofi/config
	echo ${END} "rofi"
}

gdb()
{
	yay -S pwndbg
	cp .gdbinit ${HOME}/.gdbinit
}

main()
{
	redshift
	nvim
	rofi
}

main

