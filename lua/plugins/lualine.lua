vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim', 'https://github.com/linrongbin16/lsp-progress.nvim' }
require('lsp-progress').setup()
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
    lualine_c = { function() return require('lsp-progress').progress() end },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' } },
    },
  },
}
vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('lualine_augroup', { clear = true }),
  pattern = 'LspProgressStatusUpdated',
  callback = require('lualine').refresh,
})
