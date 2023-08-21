require('snippy').setup({
    mappings = {
        is = {
            ['<Tab>'] = 'expand_or_advance',
        },
    },
})

-- Edit snippets for filetype in current buffer
local function edit_snippet_for_current_filetype()
  local filetype = vim.bo.filetype
  if filetype == '' then
    print 'invalid filetype'
    return
  end
  local nvim_home = os.getenv('MYNVIMRC')
  if nvim_home == nil then
    print 'nvim home env is not set'
    return
  end
  local snippet_file = nvim_home .. '/snippets/' .. filetype .. '.snippets'

  vim.cmd('e ' .. snippet_file)
end

vim.api.nvim_create_user_command(
    'SnippyEditFiletype',
    edit_snippet_for_current_filetype,
    { nargs = 0 }
)
