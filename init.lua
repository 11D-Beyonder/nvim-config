-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

-- Load global variables and editor options before setting up plugins.
require("options")

vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
})


-- empty setup using defaults
vim.cmd.colorscheme "catppuccin-nvim"
require("nvim-tree").setup()

