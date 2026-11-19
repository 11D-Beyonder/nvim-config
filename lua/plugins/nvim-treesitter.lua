vim.pack.add { { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' } }

local parsers = {
  'bash',
  'c',
  'cpp',
  'css',
  'html',
  'javascript',
  'json',
  'latex',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'python',
  'rust',
  'starlark',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
}

-- Only missing parsers are downloaded and compiled.
require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-highlight', { clear = true }),
  callback = function(event)
    -- Resolve filetype aliases, such as bzl -> starlark and sh -> bash.
    local lang = vim.treesitter.language.get_lang(event.match)
    if vim.tbl_contains(parsers, lang) then
      -- Start highlighting in the buffer whose filetype was just detected.
      vim.treesitter.start(event.buf)
    end
  end,
})
