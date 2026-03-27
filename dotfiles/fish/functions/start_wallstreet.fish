function start_wallstreet
    set --local myprojpath (path resolve (status --current-filename | path dirname))

    node $myprojpath/start_wallstreet.mjs
end
