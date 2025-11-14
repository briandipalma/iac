if type -q starship
    starship init fish | source
end

# pnpm
set -gx PNPM_HOME "/home/brian/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
