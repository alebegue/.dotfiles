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
alias l="exa -l --icons --git -a --no-user"
alias ll="exa -l --icons --git -a"
alias lt="exa --tree --level=2 --long --icons --git --no-user"
alias llt="exa --tree --level=2 --long --icons --git"

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

# use asdf
path+=(
  $HOME/.asdf/shims
  $HOME/.asdf/bin
)

# add CUDA
path+=(
  /usr/local/cuda-11.7/bin
)

eval "$(pixi completion --shell zsh)"
