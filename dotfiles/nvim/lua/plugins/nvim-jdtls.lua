return {
	"mfussenegger/nvim-jdtls",
	opts = function(_, opts)
		table.insert(opts.cmd, "--java-executable=/usr/lib/jvm/java-21-openjdk/bin/java")
	end,
}
