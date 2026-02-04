return {
    "mfussenegger/nvim-dap",
    config = function()
        vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "Breakpoint" })

        local dap = require('dap')

        -- Adapter: tells nvim-dap how to launch/connect to Delve
        dap.adapters.go = {
            type = 'server',
            port = '${port}',
            executable = {
                command = 'dlv',
                args = { 'dap', '-l', '127.0.0.1:${port}' },
            },
        }

        dap.adapters.delve_remote = {
            type = 'server',
            host = '127.0.0.1',
            port = 38697,
        }

        dap.configurations.go = {
            {
                type = 'go',
                name = 'Debug',
                request = 'launch',
                program = '${file}',
            },
            {
                type = 'go',
                name = 'Debug Package',
                request = 'launch',
                program = '${fileDirname}',
            },
            {
                type = 'go',
                name = 'Debug Test',
                request = 'launch',
                mode = 'test',
                program = '${fileDirname}',
            },
            {
                type = 'go',
                name = 'Attach to Process',
                request = 'attach',
                mode = 'local',
                processId = require('dap.utils').pick_process,
            },
            {
                type = 'delve_remote',
                name = 'Attach Remote',
                request = 'attach',
                mode = 'remote',
            }
        }
    end,
}
