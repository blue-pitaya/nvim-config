require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		php = { "pint" },
		blade = { "blade-formatter" },
		-- Conform will run multiple formatters sequentially
		--python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		--javascript = { { "prettierd", "prettier" } },
	},
})
