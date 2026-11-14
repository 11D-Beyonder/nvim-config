vim.pack.add {
  'https://github.com/nvim-mini/mini.pairs',
  'https://github.com/nvim-mini/mini.icons',
}
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()
require('mini.pairs').setup()
