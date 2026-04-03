export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# vim keybindings
bindkey -v

# plugins
plugins=(
    fzf
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# replace vim with neovim
alias vim="nvim"
alias vi="nvim"

# replace ls with eza
alias l="eza -l --icons -a --no-user"
alias ll="eza -l --icons -a"
alias lt="eza --tree --level=2 --long --icons --no-user"
alias llt="eza --tree --level=2 --long --icons"

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

export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/nvim-linux-x86_64/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.cargo/env"
