-- vim.keymap.set ref:
-- https://github.com/neovim/neovim/pull/16591

-- General
vim.keymap.set("n", "<C-S>", ":update<CR>")
vim.keymap.set("i", "<C-S>", "<ESC>:update<CR>")
vim.keymap.set("n", "<Space>", "<nop>")
vim.keymap.set("v", "Y", '"+y') --copy to system-wide register
vim.keymap.set("n", "<Leader>nh", ":nohlsearch<CR>")
vim.keymap.set("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')
vim.keymap.set("n", "vil", "^vg_")
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set("x", "<leader>p", "\"_dP") -- Paste text on visual without changing register content
vim.keymap.set("n", "<Leader>q", ":tabclose<CR>")
vim.keymap.set("n", "<C-P>", ":tabnext<CR>")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")


vim.keymap.set("n", "<Leader>c", ":ToggleCompletion<CR>")

vim.cmd([[autocmd FileType qf nnoremap <buffer> o :.cc<CR>]]) -- open file in qf window

-- Window bindings
--noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>
vim.keymap.set("n", "<C-Q>", "<C-W>q")
vim.keymap.set("n", "<C-J>", function () vim.cmd("TmuxNavigateDown") end)
vim.keymap.set("n", "<C-K>", function () vim.cmd("TmuxNavigateUp") end)
vim.keymap.set("n", "<C-H>", function () vim.cmd("TmuxNavigateLeft") end)
vim.keymap.set("n", "<C-L>", function () vim.cmd("TmuxNavigateRight") end)
vim.keymap.set("n", "+", "<C-W>+")
vim.keymap.set("n", "-", "<C-W>-")
vim.keymap.set("n", "<leader>v", ":vs<CR>")
vim.keymap.set("n", "<leader>s", ":split<CR>")
vim.keymap.set("n", "<C-space>", "<C-W>r")

-- LSP
vim.keymap.set("n", "gd",
  function() require 'telescope.builtin'.lsp_definitions({ show_line = false, initial_mode = 'normal' }) end)
vim.keymap.set("n", "J", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "L", function() vim.lsp.codelens.run() end)
vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end)
vim.keymap.set("n", "gr",
  function() require 'telescope.builtin'.lsp_references({ show_line = false, initial_mode = 'normal' }) end)
vim.keymap.set("n", "<Leader>r", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "<Leader>f", function() vim.lsp.buf.format() end)
vim.keymap.set("n", "gk", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("i", "<C-K>", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("i", "<C-J>", function() vim.lsp.buf.code_action() end)

vim.keymap.set("n", "<leader>m", ":MetalsOrganizeImports<CR>")

-- Debugging
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F9>", ":lua require'dap'.continue()<CR>")
--vim.keymap.set("n", "<F10>", ":lua require'dap'.close();require'dapui'.close()<CR>")
--vim.keymap.set("n", "<leader>l" , ":lua require'dap'.run_last()<CR>")
--vim.keymap.set("n", "<leader>c" , ":lua require'dap'.run_to_cursor()<CR>")
--vim.keymap.set("n", "<F2><F2>", ":lua require'dapui'.toggle()<CR>")
--vim.keymap.set("n", "<leader>ov" , ":lua require'dap'.step_over()<CR>")
--vim.keymap.set("n", "<leader>in" , ":lua require'dap'.step_into()<CR>")
--vim.keymap.set("n", "<leader>ou" , ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<F2>", ":lua require'dap'.repl.toggle()<CR>")

-- Spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
  desc = "Open Spectre"
})
