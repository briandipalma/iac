-- Remove once https://github.com/mason-org/mason-registry/pull/17323 is merged
local url = "https://download.jetbrains.com/language-server/kotlin-server/{{ version | strip_prefix \"kotlin-lsp/v\" }}/kotlin-server-{{ version | strip_prefix \"kotlin-lsp/v\" }}"
local bin = "kotlin-server-{{ version | strip_prefix \"kotlin-lsp/v\" }}/bin/intellij-server"

return {
	name = "kotlin-lsp",
	description = "Kotlin Language Server and plugin for Visual Studio Code",
	homepage = "https://github.com/Kotlin/kotlin-lsp",
	licenses = { "Apache-2.0" },
	languages = { "Kotlin" },
	categories = { "LSP" },
	source = {
		id = "pkg:generic/Kotlin/kotlin-lsp@kotlin-lsp/v263.6379.0",
		download = {
			{ target = "darwin_x64", files = { ["kotlin-lsp.zip"] = url .. ".sit" }, bin = bin },
			{ target = "darwin_arm64", files = { ["kotlin-lsp.zip"] = url .. "-aarch64.sit" }, bin = bin },
			{ target = "linux_x64", files = { ["kotlin-lsp.tar.gz"] = url .. ".tar.gz" }, bin = bin },
			{ target = "linux_arm64", files = { ["kotlin-lsp.tar.gz"] = url .. "-aarch64.tar.gz" }, bin = bin },
			{ target = "win_x64", files = { ["kotlin-lsp.zip"] = url .. ".win.zip" }, bin = "bin/intellij-server.exe" },
			{ target = "win_arm64", files = { ["kotlin-lsp.zip"] = url .. "-aarch64.win.zip" }, bin = "bin/intellij-server.exe" },
		},
	},
	bin = { ["intellij-server"] = "{{source.download.bin}}" },
	neovim = { lspconfig = "kotlin_lsp" },
}
