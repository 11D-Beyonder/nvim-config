vim.pack.add { { src = "https://github.com/saghen/blink.cmp", version = vim.version.range '1.*' } }
require('blink.cmp').setup {
    keymap = {
      preset = 'none',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ["<CR>"] = {"accept", "fallback"},
      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },
      ["<C-d>"]={"scroll_documentation_down", "fallback"},
      ["<C-u>"]={"scroll_documentation_up", "fallback"}
    },
    completion = {
      -- By default, you may press `<c-space>` to show the documentation.
      -- Optionally, set `auto_show = true` to show the documentation after a delay.
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      list = {
        selection = {
          preselect = true,
          auto_insert = false
        }
      }
    },
    sources = {
      default = { 'lsp', "path"},
    },
    -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    -- which automatically downloads a prebuilt binary when enabled.
    -- See `:help blink-cmp-config-fuzzy` for more information
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
}
