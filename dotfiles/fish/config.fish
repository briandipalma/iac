fish_add_path ~/.local/bin

if type -q starship
    starship init fish | source
end

if type -q zoxide
    zoxide init fish | source
end

# Import XDG user directories
if type -q xdg-user-dir
    set -gx XDG_DESKTOP_DIR (xdg-user-dir DESKTOP)
    set -gx XDG_DOWNLOAD_DIR (xdg-user-dir DOWNLOAD)
    set -gx XDG_TEMPLATES_DIR (xdg-user-dir TEMPLATES)
    set -gx XDG_PUBLICSHARE_DIR (xdg-user-dir PUBLICSHARE)
    set -gx XDG_DOCUMENTS_DIR (xdg-user-dir DOCUMENTS)
    set -gx XDG_MUSIC_DIR (xdg-user-dir MUSIC)
    set -gx XDG_PICTURES_DIR (xdg-user-dir PICTURES)
    set -gx XDG_VIDEOS_DIR (xdg-user-dir VIDEOS)
end
