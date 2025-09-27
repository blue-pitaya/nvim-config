return {
	--- @deprecated
	enable = function()
		--metals_config = require("metals").bare_config()
		--metals_config.settings = {
		--	serverVersion = "0.11.11",
		--	showImplicitArguments = true,
		--	excludedPackages = { "akka.actor.typed.javadsl", "akka.stream.javadsl", "akka.http.javadsl" },
		--	bloopSbtAlreadyInstalled = true,
		--	-- works awful
		--	--enableSemanticHighlighting = true
		--}
		--metals_config.on_attach = function()
		--	require("metals").setup_dap()
		--end
		---- Start metals when entering scala file
		--vim.cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])

		vim.lsp.enable("metals")
	end,
}
