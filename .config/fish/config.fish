# starship init fish | source

set -x PATH $PATH ~/.local/bin ~/.gem/ruby/2.7.0/bin ~/.local/go/bin ~/.cargo/bin ~/.node/bin
set -x BAT_THEME "gruvbox-dark"
set -x VAGRANT_HOME "/run/media/meowmeowxw/Virtualization/vagrant"
set -x MANPAGER "nvim -u NORC --noplugin -c 'set ft=man' -"
set -x MOZ_X11_EGL 1
set -x GOPATH ~/.local/go
set -x EDITOR nvim
set -x FZF_DEFAULT_OPTS "--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54"
set fish_greeting

source /etc/grc.fish

alias vi "nvim"
alias ra "ranger"
alias xc "xclip -selection clipboard"
alias g "git"
alias ga "git add"
alias gc "git commit -m"
alias gs "git status"
alias gl "git log"
alias gps "git push origin"
alias gpl "git pull --rebase origin"
alias cdg "cd (git root)"
alias meowfetch "neofetch --gtk3 off --gtk2 off --separator ' 🐱 -->'"
alias neofetch "neofetch --gtk3 off --gtk2 off"
alias disable-aslr "echo 0 | sudo tee /proc/sys/kernel/randomize_va_space"
alias enable-aslr "echo 2 | sudo tee /proc/sys/kernel/randomize_va_space"
alias remove-ghidra "rm -rf ~/ghidra_scripts"
alias lsof "grc lsof"
alias ls "exa"
alias la "ls -lag"
alias ll "ls -lg --icons"
alias lol "ll"
alias fuck "sudo"
alias ipython "ipython --colors=linux"
alias youtube-mp3 "youtube-dl --extract-audio --audio-format mp3"
alias cl "clear"
alias :q "exit"
alias enable-keyboard "echo 2 | pkexec tee /sys/module/hid_apple/parameters/fnmode"
alias rd "sed ':a;N;\$!ba;s/\n\n/\n/g' | xc"
alias rdd "sed -i ':a;N;\$!ba;s/\n\n/\n/g'"

# Config for fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set -x PURE_PROMPT_SYMBOL "»"
set -x PURE_GIT_DOWN_ARROW "↓"
set -x PURE_GIT_UP_ARROW "↑"
set -x pure_color_mute yellow
