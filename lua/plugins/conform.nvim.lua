return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				php = { "pint" },
				blade = { "blade-formatter" },
				json = { "prettierd" },
				typescript = { "prettierd" },
				clojure = { "zprint" },
				vue = { "prettierd" },
				c = { "clang-format" },

				-- Conform will run multiple formatters sequentially
				--python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				--javascript = { { "prettierd", "prettier" } },
			},
		})

		vim.keymap.set("n", "<Leader>f", function()
			require("conform").format({ lsp_fallback = true })
		end)
	end,
}
