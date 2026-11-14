vim.pack.add {
  { src = 'https://github.com/stevearc/conform.nvim' },
}

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
  },
  format_on_save = {
    timeout_ms = 500,
  },
  default_format_opts = {
    lsp_format = 'fallback',
  },
}
vim.keymap.set({ 'n', 'v' }, '<leader>lf', function() require('conform').format { async = true } end, { desc = '[L]SP [F]ormat' })
