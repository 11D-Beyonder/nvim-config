vim.pack.add { 'https://github.com/folke/which-key.nvim' }

require('which-key').setup {
  ---@type false | "classic" | "modern" | "helix"
  preset = 'helix',
  icons = {
    rules = false,
  },
}

require('which-key').add {
  { '<leader>f', group = 'Find', icon = { icon = '', color = 'blue' } },
}
