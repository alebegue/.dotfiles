# My dotfiles

## Alacritty

```shell
New-Item -ItemType SymbolicLink -Path $env:APPDATA\alacritty\alacritty.yml -Target "$env:HOMEPATH\Documents\repos\.dotfiles\alacritty\alacritty.yml"
```

## PowerShell

```shell
New-Item -ItemType SymbolicLink -Path $env:HOMEPATH\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Target "$env:HOMEPATH\Documents\repos\.dotfiles\PowerShell\Microsoft.PowerShell_profile.ps1"
```

## Starship

```shell
ln -s ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
```

## Tmux

```shell
ln -s ~/.dotfiles/.tmux_light.conf ~/.tmux_light.conf
ln -s ~/.dotfiles/.tmux_dark.conf ~/.tmux_dark.conf
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
```

## Python

```shell
ln -s ~/.dotfiles/python/virtualenv-autodetect.sh ~/.virtualenv-autodetect.sh
```

## Neovim

```shell
ln -s ~/.dotfiles/nvim ~/.config/nvim
```

## ZSH

```shell
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
```
