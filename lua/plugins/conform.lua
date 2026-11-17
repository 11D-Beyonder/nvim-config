vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
  },
  format_on_save = function(buf)
    if vim.b[buf].autosave then return end
    return { timeout_ms = 500 }
  end,
  default_format_opts = {
    lsp_format = 'fallback',
  },
}
vim.keymap.set({ 'n', 'v' }, '<leader>lf', function() require('conform').format { async = true } end, { desc = '[L]SP [F]ormat' })
