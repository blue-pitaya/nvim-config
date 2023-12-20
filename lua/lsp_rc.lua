-- Toggle virtual text
vim.api.nvim_create_user_command('ToggleVirtError', function()
  vim.g.diagnostics_virtual_text_enabled = not vim.g.diagnostics_virtual_text_enabled

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = vim.g.diagnostics_virtual_text_enabled,
      update_in_insert = false,
      underline = true,
    }
  )
end, {})

-- Set diagnostic signs
-- Its set no text, becouse of signcolumn text jumping
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.fn.sign_define('DapBreakpoint', { text = 'B', texthl = 'Breakpoint' })

-- Custom border
local border = {
  { "┏", "FloatBorder" },
  { "━", "FloatBorder" },
  { "┓", "FloatBorder" },
  { "┃", "FloatBorder" },
  { "┛", "FloatBorder" },
  { "━", "FloatBorder" },
  { "┗", "FloatBorder" },
  { "┃", "FloatBorder" },
}
vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

-- Some window shit, i really dont know what is it
-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

--
-- SERVERS CONFIG
--


-- SCALA
---@diagnostic disable-next-line: lowercase-global
-- metals_config = require("metals").bare_config()
-- metals_config.settings = {
--   serverVersion = '0.11.11',
--   showImplicitArguments = true,
--   excludedPackages = { "akka.actor.typed.javadsl", "akka.stream.javadsl", "akka.http.javadsl" },
--   bloopSbtAlreadyInstalled = true,
--   -- works awful
--   --enableSemanticHighlighting = true
-- }
-- metals_config.on_attach = function()
--   require("metals").setup_dap()
-- end
-- -- Start metals when entering scala file
-- vim.cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])

-- TODO: add description how to make it work
require 'lspconfig'.metals.setup {}

-- HASKELL
require('lspconfig').hls.setup {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
}

-- TYPESCRIPT
-- require: sudo pacman -S typescript typescript-language-server
require 'lspconfig'.tsserver.setup {
  on_attach = function(client, _)
    -- disable syntax highlight from tsserver (treesitter is preffered)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}

-- HTML & CSS
-- require: npm install vscode-langservers-extracted --global
--Enable (broadcasting) snippet capability for completion
local vscodeLangSeverCaps = vim.lsp.protocol.make_client_capabilities()
vscodeLangSeverCaps.textDocument.completion.completionItem.snippetSupport = true
require 'lspconfig'.html.setup {
  capabilities = vscodeLangSeverCaps,
}
require 'lspconfig'.cssls.setup {
  capabilities = vscodeLangSeverCaps,
}


-- VUE + TYPESCRIPT + most other JS FRAMEWORKS
-- require: sudo pacman -S typescript
-- require: sudo pacman -S typescript-language-server
-- require: some volar install (i dont remember how i did it in past)
--require 'lspconfig'.volar.setup {
--  filetypes = { 'vue', 'javascriptreact', 'typescriptreact', 'typescript', 'javascript', 'json' },
--  init_options = {
--    typescript = {
--      -- pacman installs node_modules in this path
--      tsdk = '/usr/lib/node_modules/typescript/lib'
--    }
--  },
--  on_attach = function(client, _)
--    -- disable syntax highlight from tsserver (treesitter is preffered)
--    client.server_capabilities.semanticTokensProvider = nil
--  end,
--  handlers = {
--    -- more info in help: lsp-handler, lspconfig-configurations (/handlers)
--    ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
--      if result.diagnostics ~= nil then
--        local idx = 1
--        while idx <= #result.diagnostics do
--          -- Disable 'This may be converted to an async function.'
--          if result.diagnostics[idx].code == 80006 then
--            table.remove(result.diagnostics, idx)
--          else
--            idx = idx + 1
--          end
--        end
--      end
--      vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
--    end
--  }
--}


-- DOCKERFILE
-- require: npm install -g dockerfile-language-server-nodejs
require 'lspconfig'.dockerls.setup {}


-- LUA
-- require lua-language-server, on arch: sudo pacman -S lua-language-server
require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'vim.api' },

      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}


-- RUST
-- sudo pacman -S rust-analyzer
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require 'lspconfig'.rust_analyzer.setup {
  --on_attach = function(client, bufnr)
  --  if client.supports_method("textDocument/formatting") then
  --    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --    vim.api.nvim_create_autocmd("BufWritePre", {
  --      group = augroup,
  --      buffer = bufnr,
  --      callback = function()
  --        vim.lsp.buf.format({ bufnr = bufnr })
  --      end,
  --    })
  --  end
  --end,
}


-- BASH
-- sudo pacman -S bash-language-server
require 'lspconfig'.bashls.setup {}


-- PYTHON
require 'lspconfig'.jedi_language_server.setup {
  init_options = {
    markupKindPreferred = "markdown",
    diagnostics = {
      enable = true,
      didOpen = true,
      didChange = true,
      didSave = true
    },
  },
}
require 'lspconfig'.ruff_lsp.setup {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
}


-- ANSIBLE
-- sudo pacman -S ansible-language-server ansible-lint
-- require 'lspconfig'.ansiblels.setup {}


-- ZIG
-- sudo pacman -S zls
-- require 'lspconfig'.zls.setup {}


-- GO
-- sudo pacman -S gopls
require 'lspconfig'.gopls.setup {}
