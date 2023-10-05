export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# vim keybindings
bindkey -v

# plugins
plugins=(fzf)

source $ZSH/oh-my-zsh.sh

# replace vim with neovim
alias vim="nvim"
alias vi="nvim"

# replace ls with exa
alias l="exa -l --icons -a --no-user"
alias ll="exa -l --icons -a"
alias lt="exa --tree --level=2 --long --icons --no-user"
alias llt="exa --tree --level=2 --long --icons"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"

# switch between light and dark color schemes
alias ol="set-color-scheme light"
alias od="set-color-scheme dark"

# fuzzy tmux session switching
bindkey -s ^f "tmux-sessionizer\n"

# use Starship prompt
eval "$(starship init zsh)"

# use pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# add CUDA
path+=(
  /usr/local/cuda-11.7/bin
)

# add pixi completion
eval "$(pixi completion --shell zsh)"

# add Poetry completion
fpath+=~/.zfunc
autoload -Uz compinit && compinit
export MODULAR_HOME="/home/adrien/.modular"
export PATH="/home/adrien/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
