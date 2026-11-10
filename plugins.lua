vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
})

vim.cmd.colorscheme "catppuccin-nvim"
require("nvim-tree").setup()
