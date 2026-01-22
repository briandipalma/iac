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
- Read overseer documentation and maybe use it to rebase current branch to latest master?
- Add `yaml` file type
- Add Dockerfile file type
- Add comment file type?
- Configure markdownlint-cli2 to use 100 as max line length
- Add stage key map `-` to `codediff` code view, not just the file explorer view
- Test Harper grammar checker
- Add `undotree` plugin
- Have fidget parse URLs when git pushing or mini.git open a URL or panel with the URL that can be clicked?
- Add snippets support?

```
Wed 21 Jan 2026 16:57:05 Notifications | WARN
(mini.git) remote:
remote: To create a merge request for FE-3910-react18-api-15, visit:
remote:   https://gitlab.caplin.com/front-end/mono/-/merge_requests/new?merge_request%5Bsource_branch%5D=FE-3910-react18-api-15
remote:
To https://gitlab.caplin.com/front-end/mono.git
 * [new branch]              FE-3910-react18-api-15 -> FE-3910-react18-api-15
```
