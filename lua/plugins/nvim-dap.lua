return {
	"mfussenegger/nvim-dap",
	commit = "04ce47fc5a6ef2b717f33c320fc003091cebac40", --v9.0.0
	config = function()
		vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "Breakpoint" })
		--local dap = require("dap")

		--dap.adapters.coreclr = {
		--	type = "executable",
		--	command = "/usr/local/bin/netcoredbg/netcoredbg",
		--	args = { "--interpreter=vscode" },
		--}
		--dap.configurations.cs = {
		--	{
		--		type = "coreclr",
		--		name = "launch - netcoredbg",
		--		request = "launch",
		--		program = function()
		--			return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
		--		end,
		--	},
		--}
	end,
}
