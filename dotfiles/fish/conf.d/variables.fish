# `x` exports the variable to child processes i.e. env variable
set -gx EDITOR nvim
set -gx VISUAL nvim
# Clear the startup greeting message
set -U fish_greeting
# Karma's ChromeHeadless launcher needs a Chrome binary
if test -x /usr/bin/chromium
    set -gx CHROME_BIN /usr/bin/chromium
end
