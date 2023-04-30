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
alias l="exa -l --icons --git -a"
alias lt="exa --tree --level=2 --long --icons --git"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"

# adding flags
alias df="df -h"
alias free="free -m"

bind \cf tmux-sessionizer
bind -M insert \cf tmux-sessionizer

# switch between light and dark color schemes
alias ol="set-color-scheme light"
alias od="set-color-scheme dark"

set -Ux MKL_INTERFACE_LAYER GNU,LP64
set -Ux MKL_THREADING_LAYER GNU

if status is-interactive
end

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream none
set -g fish_prompt_pwd_dir_length 3

function fish_prompt
    set_color green
    if [ $PWD != $HOME ]
        echo -n (basename $PWD)
    else
        echo -n '~'
    end
    set_color yellow
    printf '%s ' (__fish_git_prompt)
    set_color green
    echo -n '$ '
    set_color normal
end

function start_conda
    #>>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
    # <<< conda initialize <<<
end
# for CUDA: to run after env loaded
# set -gx LD_LIBRARY_PATH $CONDA_PREFIX/lib/ $LD_LIBRARY_PATH

set -Ux JAVA_HOME /usr/lib/jvm/jdk-17
set -Ux fish_user_paths $JAVA_HOME/bin $fish_user_paths

source ~/.asdf/asdf.fish
pyenv init - | source
if test -e "$VIRTUAL_ENV"; and test -f "$VIRTUAL_ENV/bin/activate.fish"
    source "$VIRTUAL_ENV/bin/activate.fish"
end
# starship init fish | source
