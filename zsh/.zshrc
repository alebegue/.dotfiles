export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# vim keybindings
bindkey -v

plugins=(fzf)

source $ZSH/oh-my-zsh.sh

# replace vim with neovim
alias vim="nvim"
alias vi="nvim"

# replace ls with exa
alias l="exa -l --icons --git -a --no-user"
alias ll="exa -l --icons --git -a"
alias lt="exa --tree --level=2 --long --icons --git --no-user"
alias llt="exa --tree --level=2 --long --icons --git"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"

# use bat instead of cat
alias cat="bat"

# use fd instead of find
alias find="fd"

# switch between light and dark color schemes
alias ol="set-color-scheme light"
alias od="set-color-scheme dark"

# use Starship prompt
eval "$(starship init zsh)"
