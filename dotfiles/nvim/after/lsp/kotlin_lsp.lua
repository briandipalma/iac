return {
	-- https://github.com/Kotlin/kotlin-lsp/blob/main/kotlin-vscode/package.json
	settings = {
		jetbrains = {
			kotlin = {
				hints = {
					settings = { types = { property = true, variable = true } },
					type = { ["function"] = { ["return"] = true, parameter = true } },
				},
			},
		},
	},
}
