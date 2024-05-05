require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		php = { "pint" },
		blade = { "blade-formatter" },
		json = { "prettierd" },
		typescript = { "prettierd" },
		clojure = { "zprint" },
		vue = { "prettierd" },
		-- Conform will run multiple formatters sequentially
		--python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		--javascript = { { "prettierd", "prettier" } },
	},
})
