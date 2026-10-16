alias c=claude
alias cat=bat
alias d="delta"
alias g=git
alias icat="flatpak run org.wezfurlong.wezterm imgcat"
alias lg=lazygit
if type -q trash-put
    alias rm=trash-put
end
if type -q kitten
    alias s="kitten ssh"
else
    alias s="ssh"
end
alias y=yazi
alias vim=nvim
if type -q shelly
    alias update="sudo cachyos-rate-mirrors && shelly upgrade all"
else if type -q pacman
    alias update="sudo pacman -Syu"
end
