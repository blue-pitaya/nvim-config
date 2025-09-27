return {
	--- Config ref: https://github.com/yaegassy/coc-intelephense
	enable = function()
		vim.lsp.config("intelephense", {
			settings = {
				intelephense = {
					files = {
						exclude = {
							"**/.git/**",
							"**/.svn/**",
							"**/.hg/**",
							"**/CVS/**",
							"**/.DS_Store/**",
							"**/node_modules/**",
							"**/bower_components/**",
							"**/vendor/**/{Tests,tests}/**",
							"**/.history/**",
							"**/vendor/**/vendor/**",
							"**/*.blade.php",
						},
					},
					diagnostics = {
						enable = true,
						undefinedMethods = false,
					},
					telemetry = {
						enabled = false,
					},
				},
			},
		})
		vim.lsp.enable("intelephense")
	end,
}
