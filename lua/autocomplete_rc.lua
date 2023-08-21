local cmp = require("cmp")

cmp.setup({
  enabled = vim.g.cmp_is_enabled,
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  window = {
    completion = {
      border = 'rounded',
      scrollbar = '',
    },
    documentation = {
      border = 'rounded',
      scrollbar = '',
    },
    entries_win = {
      wrap = true,
    }
  },
  mapping = {
    ['<tab>'] = cmp.mapping.select_next_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-h>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-l>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "snippy" },
    { name = "nvim_lsp" },
  },
  experimental = {
    ghost_text = true
  }
})

-- Toggle autocompletion
vim.api.nvim_create_user_command('ToggleCompletion', function()
  vim.g.cmp_is_enabled = not vim.g.cmp_is_enabled
  cmp.setup({enabled = vim.g.cmp_is_enabled})
end, {})
