vim.pack.add {
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/folke/lazydev.nvim',
}

require('lazydev').setup()

vim.lsp.inlay_hint.enable(true)

vim.api.nvim_create_user_command('LspInfo', 'checkhealth vim.lsp', {
  desc = 'Show LSP health and configuration',
})

vim.api.nvim_create_user_command('LspRestart', 'lsp restart <args>', {
  desc = 'Restart LSP clients for the current buffer or the named server',
  nargs = '?',
  complete = function(arg) return vim.fn.getcompletion('lsp restart ' .. arg, 'cmdline') end,
})

-- Diagnostic icons for the sign column.
vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅙',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '󰋼',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  },
}

local servers = {
  lua_ls = {},
  clangd = {},
}

for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end

vim.api.nvim_create_user_command('LspStart', function()
  if vim.bo.filetype == 'rust' then
    vim.cmd.RustAnalyzer 'start'
    return
  end
  for name in pairs(servers) do
    if vim.tbl_contains(vim.lsp.config[name].filetypes, vim.bo.filetype) then vim.lsp.enable(name) end
  end
end, { desc = 'Start LSP for the current filetype' })
