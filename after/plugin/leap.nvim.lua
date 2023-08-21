require('leap').add_default_mappings()
require('leap').init_highlight(true)

-- Colors must be set here, because leap has some fucked up highlight initation
local cYellow='#ffff00'
local cBlack='#000000'
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {fg = cBlack, bg = cYellow, bold = true})
