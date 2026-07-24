return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- sudo pacman -S prettier
				blade = { "blade-prettier" },
				-- sudo pacman -S clang
				c = { "clang-format" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				-- sudo pacman -S stylua
				lua = { "stylua" },
				-- composer global require laravel/pint
				php = { "pint" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				-- sudo pacman -S libxml2
				xml = { "xmllint" },
			},
			formatters = {
				-- `--html-whitespace-sensitivity ignore` to avoid ugly HTML tags breaking
				["blade-prettier"] = {
					command = "prettier",
					args = {
						"--parser",
						"html",
						"--html-whitespace-sensitivity",
						"ignore",
						"--stdin-filepath",
						"$FILENAME",
					},
					stdin = true,
					-- Need cwd to properly detect prettierrc
					cwd = require("conform.util").root_file({ ".prettierrc" }),
				},
				prettier = {
					prepend_args = { "--html-whitespace-sensitivity", "ignore" },
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
