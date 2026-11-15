vim.pack.add { 'https://github.com/akinsho/bufferline.nvim' }
vim.opt.termguicolors = true
require('bufferline').setup {
  options = {
    offsets = {
      {
        filetype = 'NvimTree',
        text_align = 'left',
      },
    },
  },
}
vim.keymap.set('n', ']b', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '[b', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>x', function()
  local closing_buf = vim.api.nvim_get_current_buf()
  local listed_buffers = vim.fn.getbufinfo { buflisted = 1 }

  if #listed_buffers > 1 then vim.cmd 'bprevious' end

  vim.api.nvim_buf_delete(closing_buf, {})
end, { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bb', require('bufferline').pick, { desc = 'Pick buffer' })
vim.keymap.set('n', '<leader>bc', require('bufferline').close_others, { desc = 'Close other buffers' })
vim.keymap.set('n', '<leader>bd', require('bufferline').close_with_pick, { desc = 'Pick buffers to close' })
