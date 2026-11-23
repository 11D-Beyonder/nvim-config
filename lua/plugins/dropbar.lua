vim.pack.add { 'https://github.com/Bekaboo/dropbar.nvim' }

vim.keymap.set('n', '<leader>;', function() require('dropbar.api').pick() end, { desc = 'Pick breadcrumb' })
