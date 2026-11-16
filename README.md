# Neovim Configuration

Personal Neovim configuration. The entry point is `init.lua`; plugin configuration lives in `lua/plugins/` and plugins are managed with Neovim's built-in `vim.pack`.

`mini.pairs` automatically inserts matching closing quotes and brackets while typing in Insert mode. `mini.icons` provides filetype icons and a compatibility layer for plugins that use the `nvim-web-devicons` API.

`todo-comments.nvim` highlights code comments such as `TODO:` and `FIXME:`. Use `<leader>fT` to search TODO comments in the project with `fzf-lua`, or `]t` and `[t` to jump to the next and previous comments.

`lualine.nvim` displays the statusline, including LSP task progress from `lsp-progress.nvim`.

`bufferline.nvim` displays open buffers in a tabline. Use `]b` and `[b` to move between buffers, `<leader>x` to close the current buffer, `<leader>bb` to pick a buffer, `<leader>bc` to close other buffers, and `<leader>bd` to pick buffers to close.

`nvim-lspconfig` enables `lua_ls` for Lua and `clangd` for C/C++.

When an LSP attaches, `gd` finds definitions, `gD` declarations, `gy` type definitions, `gi` implementations, `gO` document symbols, and `gr` references. All six mappings use `fzf-lua`.

`<leader>la` opens LSP code actions with `fzf-lua`; `<leader>lr` renames the symbol using Neovim's input prompt.

Plugin and configuration choices are informed by current practices in established Neovim distributions such as LazyVim, AstroNvim, NvChad, and LunarVim, adapted to this configuration's needs.

## External Dependencies

| Tool | Purpose | Required for |
| --- | --- | --- |
| Neovim with `vim.pack` support | Editor and plugin management | Running this configuration |
| Git | Fetching plugins with `vim.pack` and running Git pickers | Plugin installation and Git features |
| `fzf` | Fuzzy matching interface for `fzf-lua` | Fuzzy finders |
| `ripgrep` (`rg`) | Text search in `fzf-lua`; required for grep pickers on Windows | Search pickers |
| `lua-language-server` | Lua completion, diagnostics, and navigation through `lua_ls` | Lua LSP features |
| `clangd` | C/C++ completion, diagnostics, and navigation | C/C++ LSP features |
| `stylua` | Formatting Lua files through `conform.nvim` | Lua formatting |
| `fd` | Faster file discovery in `fzf-lua` | Optional file-finder enhancement |
| `bat` | File previews in `fzf-lua` | File previews |

Make sure required executables are available in the `PATH` used to launch Neovim. Plugins are fetched from Git repositories on first install, so Git access to those repositories is also needed.
