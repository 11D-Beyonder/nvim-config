vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = event.buf, desc = '[R]ename' })
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'Code [A]ction' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = '[G]oto [D]eclaration' })
  end,
})
