require('telescope').setup{
  defaults = {
    layout_config = {
      horizontal = {
        height = { padding = 1 },
        width = { padding = 18 },
        prompt_position = "top",
      },
      vertical = {
        height = { padding = 1 },
        width = { padding = 18 },
        prompt_position = "top",
      },
    },
    wrap_results = true,
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous"
      }
    },
    --file_ignore_patterns = { "project/target", "project/project", "target" },
    path_display = {"absolute"},
    borderchars =  { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
    sorting_strategy = "ascending"
  },
  pickers = {
    find_files = {
    },
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true
    },
  },
  extensions = {}
}

-- Magic telescope border ;)
vim.cmd([[au InsertEnter * hi! TelescopePromptBorder guifg=#00ffd7]])
vim.cmd([[au InsertLeave * hi! link TelescopePromptBorder TelescopeBorder]])

-- Keybindings
vim.keymap.set("n", "<Space><Space>", ":Telescope find_files<cr>")
vim.keymap.set("n", "<Space>g", function() vim.cmd("Telescope live_grep") end)
vim.keymap.set("n", "<Space>r", ":Telescope resume<cr>")
vim.keymap.set("n", "<Space>j", ":Telescope buffers initial_mode=normal<cr>")
vim.keymap.set("n", "<Space>k", ":Telescope keymaps<cr>")
vim.keymap.set("n", "<Space>n", ":Telescope lsp_dynamic_workspace_symbols<cr>")
vim.keymap.set("n", "<Leader><Leader>", function() require('telescope.builtin').diagnostics({line_width='full', layout_strategy='vertical', initial_mode='normal'}) end)
vim.keymap.set("n", "<Space>h", ":Telescope help_tags<cr>")
vim.keymap.set("n", "<Space>p", ":Telescope registers initial_mode=normal<cr>")
vim.keymap.set("n", "<Space>s", function ()
  require('telescope.builtin').git_status()
end)

-- Live grep selected text
function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ''
  end
end
vim.keymap.set('v', '<space>g', function()
  local text = vim.getVisualSelection()
  require('telescope.builtin').live_grep({ default_text = text })
end, { noremap = true, silent = true })
