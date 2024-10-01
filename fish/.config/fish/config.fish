# set Vi key bindings
#fish_vi_key_bindings

# remove greeting message
set fish_greeting

# remove underline path
set fish_color_valid_path

# replace vim with neovim
alias vim="nvim"
alias vi="nvim"

# replace ls with exa
alias l="eza -l --icons --git -a --no-user"
alias ll="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git --no-user"
alias llt="eza --tree --level=2 --long --icons --git"

# adding flags
alias df="df -h"
alias free="free -m"

bind \cf tmux-sessionizer
bind -M insert \cf tmux-sessionizer

# switch between light and dark color schemes
alias ol="set-color-scheme light"
alias od="set-color-scheme dark"

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream none
set -g fish_prompt_pwd_dir_length 3

function fish_prompt
    set_color yellow
    if [ $PWD != $HOME ]
        echo -n (basename $PWD)
    else
        echo -n '~'
    end
    set_color green
    printf '%s ' (__fish_git_prompt)
    set_color red
    echo -n '| '
    set_color normal
end

# Starship
#starship init fish | source

# pyenv
pyenv init - | source

# pixi
#pixi completion --shell fish | source
#pixi completion --shell fish | source

# Created by `pipx` on 2024-04-04 07:56:01
set PATH $PATH /home/alebegue/.local/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/alebegue/miniconda3/bin/conda
    eval /home/alebegue/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/alebegue/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/alebegue/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/alebegue/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
