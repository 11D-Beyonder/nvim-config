vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {
  latex = {
    -- Requires the utftex executable for multi-line formula layout.
    converter = 'utftex',
    position = 'replace',
  },
}
