#!/usr/bin/env fish

function bootstrap_cli
    distrobox enter work -- fish -c "zi; exec fish"
end

bootstrap_cli
