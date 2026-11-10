vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" }
})

require("plugins.catppuccin")
require("plugins.nvim-tree")
require("plugins.gitsigns")
