local nvim_settings = {
  runtime = {
    -- Tell the language server which version of Lua you're using
    version = 'LuaJIT',
    path = {
      'lua/?.lua',
      'lua/?/init.lua',
    },
  },
  diagnostics = {
    -- Get the language server to recognize the `vim` global
    globals = {'vim'},
  },
  workspace = {
    checkThirdParty = false,
    library = {
      -- Make the server aware of Neovim runtime files
      vim.env.VIMRUNTIME,
      vim.g.luvit_meta
    },
  },
  telemetry = {
    enable = false,
  },
}

---@type vim.lsp.Config
return {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  settings = {Lua = nvim_settings},
  root_markers = {'lazy-lock.json'}
}
