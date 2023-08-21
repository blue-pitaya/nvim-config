vim.cmd [[packadd packer.nvim]]
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return require('packer').startup(function(use)

  -- -- Plugin dev: 
  -- use '/home/kodus/projects/nvim-scala-tools/nvim-plugin/'

  -- Packer itself :)
  use 'wbthomason/packer.nvim'

  -- Required for telescope and other plugins
  use 'nvim-lua/plenary.nvim'

  -- File browser
  use { 's1n7ax/nvim-window-picker', tag = 'v1.5' }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- Status bar
  use 'nvim-lualine/lualine.nvim'

  -- Telescope (fuzzy finder), needs: fd and rg installed
  use '~/projects/forks/telescope.nvim'

  -- Diff plugin
  use 'sindrets/diffview.nvim'

  -- LSP & programming
  use 'neovim/nvim-lspconfig' -- Huge repo of lsp configs
  use 'scalameta/nvim-metals' -- Scala plugin (syntax, lsp, code actions and more)
  use 'jose-elias-alvarez/null-ls.nvim' -- LSP injections from not so LSP lang tools

  -- Prettier (do i still need it?)
  use  {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
    ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'vue', 'svelte', 'yaml', 'html'}
  }

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Debugger
  use 'mfussenegger/nvim-dap'

  -- Auto brackets
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Snippets
  use { 'dcampos/nvim-snippy', commit = '834820d' }
  use { 'dcampos/cmp-snippy',  commit = '9af1635' } -- Insert snippets in autocompletion

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Find and replace
  use 'nvim-pack/nvim-spectre'

  -- Text/file navigation
  use { 'ggandor/leap.nvim', requires = {"tpope/vim-repeat"} }
end)

