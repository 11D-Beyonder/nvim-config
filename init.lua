if vim.g.neovide then
    vim.opt.guifont = "Maple_Mono_NF_CN,JetBrains_Mono,Fira_Code:h12"
end

vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
})
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
vim.cmd.colorscheme "catppuccin-nvim"
require("nvim-tree").setup()

