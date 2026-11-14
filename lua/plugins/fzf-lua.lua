vim.pack.add { 'https://github.com/ibhagwan/fzf-lua' }

require('fzf-lua').setup {
  defaults = {
    file_icons = true,
    git_icons = true,
  },
  winopts = {
    preview = {
      default = 'bat',
    },
  },
}

local fzf = require 'fzf-lua'

vim.keymap.set('n', '<leader>f<CR>', fzf.resume, { desc = 'Resume previous search' })
vim.keymap.set('n', '<leader>fa', function() fzf.files { cwd = vim.fn.stdpath 'config' } end, { desc = 'Find Neovim config files' })
vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fc', fzf.grep_cword, { desc = 'Search word under cursor' })
vim.keymap.set('n', '<leader>fC', fzf.commands, { desc = 'Find commands' })
vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fF', function() fzf.files { hidden = true, no_ignore = true } end, { desc = 'Find all files' })
vim.keymap.set('n', '<leader>fg', fzf.git_files, { desc = 'Find Git files' })
vim.keymap.set('n', '<leader>fh', fzf.help_tags, { desc = 'Find help' })
vim.keymap.set('n', '<leader>fk', fzf.keymaps, { desc = 'Find keymaps' })
vim.keymap.set('n', '<leader>fl', fzf.lines, { desc = 'Find lines in open buffers' })
vim.keymap.set('n', '<leader>fm', fzf.man_pages, { desc = 'Find man pages' })
vim.keymap.set('n', '<leader>fo', fzf.oldfiles, { desc = 'Find recent files' })
vim.keymap.set('n', '<leader>fO', function() fzf.oldfiles { cwd_only = true } end, { desc = 'Find recent files in cwd' })
vim.keymap.set('n', "<leader>f'", fzf.marks, { desc = 'Find marks' })
vim.keymap.set('n', '<leader>fr', fzf.registers, { desc = 'Find registers' })
vim.keymap.set('n', '<leader>fs', fzf.lsp_document_symbols, { desc = 'Find document symbols' })
vim.keymap.set('n', '<leader>ft', fzf.colorschemes, { desc = 'Find colorschemes' })
vim.keymap.set('n', '<leader>fw', fzf.live_grep, { desc = 'Search text in real time' })
vim.keymap.set('n', '<leader>fW', fzf.grep, { desc = 'Search text' })
vim.keymap.set('n', '<leader>fu', fzf.undotree, { desc = 'Find undo history' })

vim.keymap.set('n', '<leader>gb', fzf.git_branches, { desc = 'Git branches' })
vim.keymap.set('n', '<leader>gc', fzf.git_commits, { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gC', fzf.git_bcommits, { desc = 'Git commits for current file' })
vim.keymap.set('n', '<leader>gt', fzf.git_status, { desc = 'Git status' })
vim.keymap.set('n', '<leader>gT', fzf.git_stash, { desc = 'Git stash' })

vim.keymap.set('n', '<leader>lD', fzf.diagnostics_workspace, { desc = 'Workspace diagnostics' })
vim.keymap.set('n', '<leader>ls', fzf.lsp_document_symbols, { desc = 'Document symbols' })

vim.keymap.set('n', '<leader>fT', '<cmd>TodoFzfLua<CR>', { desc = 'Find TODO comments' })
