# Neovim config

## Adding a new filetype

- Add a `after/ftplugin/$FILETYPE.lua` file
- Set any filetype options e.g. `vim.wo.spell = true`
- Install any LSP servers/formatters/linters for the filetype e.g `install_package("prettier")`
- Install treesitter parsers e.g. `treesitter.install({ "html" })`
- Enable the treesitter features
- Enable the LSP servers e.g. `vim.lsp.enable("html")`
- Set the formatters for the filetype e.g. `conform.formatters_by_ft.html = { "prettier" }`
- Call `try_lint` on any filetype linters e.g. `require("lint").try_lint("markdownlint-cli2")`

## Tips

`:set filetype?` to find out filetype. There seems to be no way to find the name of the treesitter
language for the filetype - you just need to know `typescriptreact` filetype means the `tsx`
treesitter language.

## To Do

Implement `root dir` searching
Add full ESLint support
Add full vtsls support
Add a way to see the difference between local git branch state and remote branch state (in statusline?)
Read overseer documentation and maybe use it to rebase current branch to latest master?
Add html filetype
Add yaml filetype
Add Dockerfile filetype
Add comment filetype?
Add fish filetype
Configure markdownlint-cli2 to use 100 as max line length
Add the `q` to close utility buffers keymap from LazyVim
