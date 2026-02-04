-- sudo pacman -S stylua
-- composer global require laravel/pint
-- npm install -g prettier @prettier/plugin-xml
return {
	"stevearc/conform.nvim",
	config = function()
		local home = os.getenv("HOME")

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				php = { "pint" },
				blade = { "blade-formatter" },
				json = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				--html = { "prettier" },
				css = { "prettier" },
				c = { "clang-format" },
				xml = { "prettier-xml" },
			},
			formatters = {
				["prettier-xml"] = {
					command = "prettier",
					args = {
						"--plugin",
						home .. "/.local/lib/node_modules/@prettier/plugin-xml/src/plugin.js",
						"--parser",
						"xml",
						"--tab-width",
						"4",
						"--xml-whitespace-sensitivity",
						"ignore",
					},
					stdin = true,
				},
			},
		})

		vim.keymap.set("n", "<Leader>f", function()
			require("conform").format({ lsp_fallback = true })
		end)

		-- Autoformat before saving
		vim.keymap.set("n", "<C-S>", function()
			require("conform").format({ lsp_fallback = true })
			vim.cmd("wa")
		end)
		vim.keymap.set("i", "<C-S>", function()
			require("conform").format({ lsp_fallback = true })
			vim.cmd("stopinsert")
			vim.cmd("wa")
		end)
	end,
}
