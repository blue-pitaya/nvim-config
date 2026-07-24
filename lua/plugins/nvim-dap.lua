return {
	"mfussenegger/nvim-dap",
	config = function()
		vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "Breakpoint" })

		local dap = require("dap")

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--quiet", "--interpreter=dap" },
		}

		local last_input = {}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					vim.fn.system("make")
					local parts = vim.split(vim.fn.input("Run: ", vim.fn.getcwd() .. "/target/main", "file"), " ")
					last_input = parts
					return parts[1]
				end,
				args = function()
					return vim.list_slice(last_input, 2)
				end,
				cwd = "${workspaceFolder}",
			},
		}

		-- Adapter: tells nvim-dap how to launch/connect to Delve
		dap.adapters.go = {
			type = "server",
			port = "${port}",
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:${port}" },
			},
		}

		dap.adapters.delve_remote = {
			type = "server",
			host = "127.0.0.1",
			port = 38697,
		}

		dap.configurations.go = {
			{
				type = "go",
				name = "Debug",
				request = "launch",
				program = "${file}",
			},
			{
				type = "go",
				name = "Debug Package",
				request = "launch",
				program = "${fileDirname}",
			},
			{
				type = "go",
				name = "Debug Test",
				request = "launch",
				mode = "test",
				program = "${fileDirname}",
			},
			{
				type = "go",
				name = "Attach to Process",
				request = "attach",
				mode = "local",
				processId = require("dap.utils").pick_process,
			},
			{
				type = "delve_remote",
				name = "Attach Remote",
				request = "attach",
				mode = "remote",
			},
		}
	end,
}
