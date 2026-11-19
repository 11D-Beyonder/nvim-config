vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/folke/noice.nvim',
}

require('noice').setup {
  presets = { bottom_search = true },
  -- Blink provides the completion menu.
  popupmenu = { enabled = false },
  lsp = {
    signature = { enabled = false },
    message = { enabled = false },
  },
  status = { progress = { event = 'lsp', kind = 'progress' } },
  routes = {
    -- Keep progress available to lualine without showing a popup.
    { filter = { event = 'lsp', kind = 'progress' }, opts = { skip = true } },
  },
}
