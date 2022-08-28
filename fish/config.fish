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

# function to change color scheme
function set_color_scheme;
    set theme $argv[1]
    sed -i "s/colors: \*.[A\-z].*/colors: \*$theme/g" /mnt/c/Users/AdrienLebegue/Documents/repos/dotfiles/alacritty/alacritty.yml &&

    if [ -n $TMUX ]; tmux source-file ~/.tmux_$theme.conf;
    end

    if [ "$theme" = "light" ]; sed -i 's/vim.g.tokyonight_style = .*/vim.g.tokyonight_style = "day"/g' ~/repos/dotfiles/nvim/after/plugin/colors.lua;
    else; sed -i 's/vim.g.tokyonight_style = .*/vim.g.tokyonight_style = "night"/g' ~/repos/dotfiles/nvim/after/plugin/colors.lua;
    end
end

# set THEME environment variable
#export THEME="dark"
set theme $(sed -n "s/colors: \*\([A\-z]*\).*/\1/p" /mnt/c/Users/AdrienLebegue/Documents/repos/dotfiles/alacritty/alacritty.yml)
#export THEME="$(cat /mnt/c/Users/AdrienLebegue/Documents/repos/dotfiles/alacritty/alacritty.yml | grep -oP '(?<=colors:\ \*).*[A-z]')"
set_color_scheme $theme

# switch between light and dark themes 
alias ol="set_color_scheme light;"
alias od="set_color_scheme dark;"

if status is-interactive
    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
end

pyenv init - | source
starship init fish | source
