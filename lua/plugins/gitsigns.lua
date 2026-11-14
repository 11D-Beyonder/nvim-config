vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }

require('gitsigns').setup {
  current_line_blame = true, -- Show blame for the cursor line; toggle with :Gitsigns toggle_current_line_blame.
  current_line_blame_opts = {
    delay = 300, -- Wait this many milliseconds after cursor movement before showing blame.
  },
}
