vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }
require('lualine').setup {
  options = {
    globalstatus = true,
    component_separators = '',
    section_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' } } },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { { require('noice').api.status.progress.get, cond = require('noice').api.status.progress.has } },
    lualine_x = {
      { require('noice').api.status.command.get, cond = require('noice').api.status.command.has },
      { require('noice').api.status.mode.get, cond = require('noice').api.status.mode.has },
      { require('noice').api.status.search.get, cond = require('noice').api.status.search.has },
    },
    lualine_y = { 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' } },
    },
  },
}
