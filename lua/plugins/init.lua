vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/NMAC427/guess-indent.nvim" },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
})

require("plugins.catppuccin")
require("plugins.nvim-tree")
require("plugins.gitsigns")
require("plugins.which-key")
require("plugins.fzf-lua")
