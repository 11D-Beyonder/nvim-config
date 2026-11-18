vim.pack.add { 'https://github.com/folke/snacks.nvim' }

require('snacks').setup {
  input = { enabled = true },
  picker = {
    enabled = true,
    ui_select = true,
    sources = {
      files = { hidden = true },
      diagnostics = { filter = { cwd = false } },
      lsp_symbols = { filter = { default = true, lua = true } },
    },
  },
  terminal = { enabled = true },
  scroll = {},
}
