local mytheme = require'lualine.themes.ayu_dark'

-- Change the background of lualine_c section for normal mode
mytheme.normal.c.bg = '#303030'
mytheme.normal.c.fg = '#e4e4e4'
mytheme.inactive.c.bg = '#303030'
mytheme.inactive.c.fg = '#4e4e4e'

local function autocomplete_status()
  local status = ''
  if vim.g.cmp_is_enabled then
    status = status..'C'
  end
  if vim.g.diagnostics_virtual_text_enabled then
    status = status..'V'
  end
  return status
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = mytheme,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diagnostics'},
    --lualine_b = {
    --  {'diagnostics',
    --    sources = {'nvim_workspace_diagnostic'}
    --    sections = {'error', 'warn'},
    --  }
    --},
    lualine_c = {{'filename', path = 1}}, -- 0 = just filename, 1 = relative path, 2 = absolute path
    lualine_x = {'filetype', autocomplete_status},
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
