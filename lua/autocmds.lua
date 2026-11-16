vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local fzf = require 'fzf-lua'

    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = event.buf, desc = '[R]ename' })
    if vim.bo[event.buf].filetype == 'rust' then
      vim.keymap.set('n', '<leader>la', '<cmd>RustLsp codeAction<CR>', { buffer = event.buf, desc = 'Code [A]ction' })
      vim.keymap.set('n', 'K', '<cmd>RustLsp hover actions<CR>', { buffer = event.buf, desc = 'Hover actions' })
    else
      vim.keymap.set('n', '<leader>la', fzf.lsp_code_actions, { buffer = event.buf, desc = 'Code [A]ction' })
    end
    vim.keymap.set('n', 'gd', fzf.lsp_definitions, { buffer = event.buf, desc = 'Goto definition' })
    vim.keymap.set('n', 'gD', fzf.lsp_declarations, { buffer = event.buf, desc = 'Goto declaration' })
    vim.keymap.set('n', 'gy', fzf.lsp_typedefs, { buffer = event.buf, desc = 'Goto type definition' })
    vim.keymap.set('n', 'gi', fzf.lsp_implementations, { buffer = event.buf, desc = 'Goto implementation' })
    vim.keymap.set('n', 'gO', fzf.lsp_document_symbols, { buffer = event.buf, desc = 'Document symbols' })
    vim.keymap.set('n', 'gr', fzf.lsp_references, { buffer = event.buf, desc = 'References' })
  end,
})
