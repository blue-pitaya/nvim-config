-- sudo pacman -S tree-sitter-cli

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                pcall(vim.treesitter.start, ev.buf)
                -- use treesitter indentation when indent queries exist; fall back to autoindent otherwise
				-- https://github.com/nvim-treesitter/nvim-treesitter#indentation
                local has_indent = pcall(function()
                    return vim.treesitter.query.get(ev.match, "indents") ~= nil
                end)
                if has_indent and vim.treesitter.query.get(ev.match, "indents") then
                    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
	end,
}
