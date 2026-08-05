return {
	-- npm i intelephense -g
	enable = function()
		-- Config ref: https://github.com/yaegassy/coc-intelephense
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
					},
					telemetry = {
						enabled = false,
					},
					completion = {
						parameterCase = "camel",
						propertyCase = "camel",
					},
				},
			},
		})
		vim.lsp.enable("intelephense")
	end,
}
