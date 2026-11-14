vim.pack.add {
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/folke/lazydev.nvim',
}

require('lazydev').setup()

local servers = {
  lua_ls = {},
}

for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end
