-- Skip formatting during auto-save while keeping other write events active.
vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('auto-save-format', { clear = true }),
  pattern = { 'AutoSaveWritePre', 'AutoSaveWritePost' },
  callback = function(event) vim.b[event.data.saved_buffer].autosave = event.match == 'AutoSaveWritePre' end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local picker = Snacks.picker

    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = event.buf, desc = '[R]ename' })
    if vim.bo[event.buf].filetype == 'rust' then
      vim.keymap.set('n', '<leader>la', '<cmd>RustLsp codeAction<CR>', { buffer = event.buf, desc = 'Code [A]ction' })
      vim.keymap.set('n', 'K', '<cmd>RustLsp hover actions<CR>', { buffer = event.buf, desc = 'Hover actions' })
    else
      vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'Code [A]ction' })
    end
    vim.keymap.set('n', 'gd', picker.lsp_definitions, { buffer = event.buf, desc = 'Goto definition' })
    vim.keymap.set('n', 'gD', picker.lsp_declarations, { buffer = event.buf, desc = 'Goto declaration' })
    vim.keymap.set('n', 'gy', picker.lsp_type_definitions, { buffer = event.buf, desc = 'Goto type definition' })
    vim.keymap.set('n', 'gi', picker.lsp_implementations, { buffer = event.buf, desc = 'Goto implementation' })
    vim.keymap.set('n', 'gO', picker.lsp_symbols, { buffer = event.buf, desc = 'Document symbols' })
    vim.keymap.set('n', 'gr', picker.lsp_references, { buffer = event.buf, nowait = true, desc = 'Goto references' })
  end,
})
