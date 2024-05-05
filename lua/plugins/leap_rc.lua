require('leap').add_default_mappings()
require('leap').init_highlight(true)

-- Colors must be set here, because leap has some fucked up highlight initation
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = '#000000', bg = '#ffff00', bold = true })
