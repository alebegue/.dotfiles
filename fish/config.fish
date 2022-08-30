# set Vi key bindings
fish_vi_key_bindings

# remove greeting message
set fish_greeting

# remove underline path
set fish_color_valid_path

# replace vim with neovim
alias vim="nvim"
alias vi="nvim"

# replace ls with exa
alias ls="exa -al --color=always --group-directories-first"
alias la="exa -a --color=always --group-directories-first"
alias ll="exa -l --color=always --group-directories-first"
alias lt="exa -aT --color=always --group-directories-first"
alias l.="exa -a | egrep '^\.'"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# adding flags
alias df="df -h"
alias free="free -m"

# set color scheme given Alacritty config file
set COLOR $(sed -n "s/colors: \*\([A\-z]*\).*/\1/p" /mnt/c/Users/AdrienLebegue/Documents/repos/dotfiles/alacritty/alacritty.yml)
set-color-scheme $COLOR

# switch between light and dark color schemes
alias ol="set-color-scheme light"
alias od="set-color-scheme dark"

if status is-interactive
end

pyenv init - | source
starship init fish | source
