# My dotfiles

## Alacritty

```shell
New-Item -ItemType SymbolicLink -Path $env:APPDATA\alacritty\alacritty.yml -Target "$env:HOMEPATH\Documents\repos\dotfiles\alacritty\alacritty.yml"
```

## PowerShell

```shell
New-Item -ItemType SymbolicLink -Path $env:HOMEPATH\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Target "$env:HOMEPATH\Documents\repos\dotfiles\PowerShell\Microsoft.PowerShell_profile.ps1"
```

## Starship

```shell
ln -s ~/repos/dotfiles/starship/starship.toml ~/.config/starship.toml
```

## Tmux

```shell
ln -s ~/repos/dotfiles/tmux/.tmux_light.conf ~/.tmux_light.conf
ln -s ~/repos/dotfiles/tmux/.tmux_dark.conf ~/.tmux_dark.conf
ln -s ~/repos/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

## Python

```shell
ln -s ~/repos/dotfiles/python/virtualenv-autodetect.sh ~/.virtualenv-autodetect.sh
```

Add following line in  shell config file

```shell
source ~/.virtualenv-autodetect.sh
```

## Neovim

```shell
ln -s ~/repos/dotfiles/nvim ~/.config/nvim
```

## ZSH

```shell
ln -s ~/repos/dotfiles/zsh/.zshrc ~/.zshrc
```
