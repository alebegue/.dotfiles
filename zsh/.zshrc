if [[ -z $TMUX ]]; then
    path+=(~/.local/bin)
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# Tmux configuration
#if command -v tmux>/dev/null; then
#    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && tmux new-session -A -s main
#fi

# Function to change color scheme
function set_color_scheme() {
    theme=$1
    sed -i "s/colors: \*.[A-z].*/colors: \*$theme/g" /mnt/c/Users/AdrienLebegue/Documents/repos/.dotfiles/alacritty/alacritty.yml &&
    if [[ -n $TMUX ]]; then
        tmux source-file ~/.tmux_$theme.conf;
    fi
    if [ "$theme" = "light" ];
    then
        sed -i 's/vim.g.tokyonight_style = .*/vim.g.tokyonight_style = "day"/g' ~/projects/.dotfiles/nvim/after/plugin/colors.lua
    else
        sed -i 's/vim.g.tokyonight_style = .*/vim.g.tokyonight_style = "night"/g' ~/projects/.dotfiles/nvim/after/plugin/colors.lua
    fi
}

# Set THEME environment variable
#export THEME="dark"
theme=$(sed -n "s/colors: \*\([A-z]*\).*/\1/p" /mnt/c/Users/AdrienLebegue/Documents/repos/.dotfiles/alacritty/alacritty.yml)
#export THEME="$(cat /mnt/c/Users/AdrienLebegue/Documents/repos/.dotfiles/alacritty/alacritty.yml | grep -oP '(?<=colors:\ \*).*[A-z]')"
set_color_scheme $theme

# Switch between light and dark themes 
alias ol="set_color_scheme light;"
alias od="set_color_scheme dark;"

# Starship
eval "$(starship init zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Rust
. "$HOME/.cargo/env"

# Aliases
alias vim="nvim"
alias vi="nvim"

# Load virtualenv autodetect
source ~/.virtualenv-autodetect.sh
