# Neovim config

## Adding a new file type

- Add a `after/ftplugin/$FILETYPE.lua` file
- Set any file type options e.g. `vim.wo.spell = true`
- Install any LSP servers/formatters/linters for the file type e.g. `install_package("prettier")`
- Install Tree-sitter parsers e.g. `treesitter.install({ "html" })`
- Enable the Tree-sitter features
- Enable the LSP servers e.g. `vim.lsp.enable("html")`
- Set the formatters for the file type e.g. `conform.formatters_by_ft.html = { "prettier" }`
- Call `try_lint` on any file type linters e.g. `require("lint").try_lint("markdownlint-cli2")`

## Tips

`:set filetype?` to find out file type. There seems to be no way to find the name of the Tree-sitter
language for the file type - you just need to know `typescriptreact` file type means the `tsx`
Tree-sitter language.

To check an LSPs capabilities run `:lua =vim.lsp.get_clients()[1].server_capabilities`

To check what formatters are enabled for a buffer use `:ConformInfo`

## To Do

- Add a way to see the difference between local git branch state and remote branch state (in statusline?)
- Fix using autocomplete in git commit messages
- Read overseer documentation and maybe use it to rebase current branch to latest master?
- Configure markdownlint-cli2 to use 100 as max line length
- Test Harper grammar checker
- Add snippets support?
- "on_result_diagnostics", remove_on_restart = true }, Isn't clearing down the diagnostics
