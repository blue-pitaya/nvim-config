require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "javascript", "typescript", "tsx", "html", "css", "query", "java", "zig", "go", "haskell", "scala", "rust", "python", "perl", "bash", "php" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,
  highlight = {
    enable = true,
    --disable = { "php" },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
    disable = { "php" },
  },
}

-- Treat vue files as html for correct syntax highligh in single file components in vue.js
vim.treesitter.language.register("html", "vue")
