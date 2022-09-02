# My dotfiles

```shell
sudo apt install stow
```

## Alacritty

```shell
New-Item -ItemType SymbolicLink -Path $env:APPDATA\alacritty\alacritty.yml -Target "$env:HOMEPATH\Documents\repos\dotfiles\alacritty\alacritty.yml"
```

## Bash scripts

```shell
stow -t $HOME bash
```

## Fish shell

```shell
stow -t $HOME fish
```

## Neovim

```shell
stow -t $HOME nvim
```

## PowerShell profile

```shell
New-Item -ItemType SymbolicLink -Path $env:HOMEPATH\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Target "$env:HOMEPATH\Documents\repos\dotfiles\PowerShell\Microsoft.PowerShell_profile.ps1"
```

## Starship

```shell
stow -t $HOME starship
```

## Tmux

```shell
stow -t $HOME tmux
```

## ZSH shell

```shell
stow -t $HOME zsh
```

Python virtualenv

```shell
ln -s ~/repos/dotfiles/python/virtualenv-autodetect.sh ~/.virtualenv-autodetect.sh
```

Add following line in  shell config file

```shell
source ~/.virtualenv-autodetect.sh
```
