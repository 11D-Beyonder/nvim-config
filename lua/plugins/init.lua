vim.pack.add {
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
  { src = 'https://github.com/NMAC427/guess-indent.nvim' },
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/folke/which-key.nvim' },
  { src = 'https://github.com/ibhagwan/fzf-lua' },
  { src = 'https://github.com/j-hui/fidget.nvim' },
}

require 'plugins.catppuccin'
require 'plugins.nvim-tree'
require 'plugins.gitsigns'
require 'plugins.which-key'
require 'plugins.fzf-lua'
require 'plugins.guess-indent'
require 'plugins.fidget'
require 'plugins.nvim-lspconfig'
require 'plugins.blink'
require 'plugins.conform'
