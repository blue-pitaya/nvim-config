vim.opt.background = "dark"

local definitions = require("pitaya_theme").definitions

for _, d in pairs(definitions) do
	vim.api.nvim_set_hl(0, d[1], d[2])
end
