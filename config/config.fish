starship init fish | source

set -x BAT_THEME "TwoDark"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set fish_greeting

source /etc/grc.fish

alias vi 'nvim'
alias ra 'ranger'
alias xc 'xclip -selection clipboard'
alias meowfetch 'neofetch --gtk3 off --gtk2 off --separator "  -->"'
alias neofetch 'neofetch --gtk3 off --gtk2 off'
alias disable-aslr 'echo 0 | sudo tee /proc/sys/kernel/randomize_va_space'
alias enable-aslr 'echo 2 | sudo tee /proc/sys/kernel/randomize_va_space'
alias remove-ghidra 'rm -rf ~/ghidra_scripts'
alias lsof 'grc lsof'
alias cat 'bat'
alias ls 'exa'
alias la 'exa -lag'
alias ll 'exa -lg'
alias lol 'll'
alias fuck 'sudo'
alias ipython "ipython --colors=linux"
alias youtube-mp3 "youtube-dl --extract-audio --audio-format mp3"
alias cl "clear"
alias :q "exit"
alias pwndbg "/usr/bin/gdb --init-command=~/.gdb/pwndbg --nh -q"
alias gef "/usr/bin/gdb --init-command=~/.gdb/gef --nh -q"
alias gdb "gdb -x ~/.gdb/meow-gdb.py"
alias enable-keyboard "echo 2 | pkexec tee /sys/module/hid_apple/parameters/fnmode"
alias rd "sed ':a;N;\$!ba;s/\n\n/\n/g' | xc"
alias rdd "sed -i ':a;N;\$!ba;s/\n\n/\n/g'"
alias kj "cd ~/Projects/oop-proj/repo"

# Config for fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
