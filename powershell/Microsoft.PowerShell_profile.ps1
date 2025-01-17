$ENV:STARSHIP_CONFIG = "$HOME\.dotfiles\starship\.config\starship.toml"
Invoke-Expression (&starship init powershell)

Set-Alias -Name vim -Value nvim
Set-Alias -Name vi -Value nvim

Function l {
    eza -l --icons --git -a --no-user $args
}

Function lt {
    eza --tree --level=2 --long --icons --git --no-user $args
}
