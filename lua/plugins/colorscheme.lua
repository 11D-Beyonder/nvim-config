vim.pack.add {
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
  { src = 'https://github.com/f-person/auto-dark-mode.nvim' },
}

require('catppuccin').setup {
  auto_integrations = true,
}
vim.cmd.colorscheme 'catppuccin-nvim'
require('auto-dark-mode').setup {}
