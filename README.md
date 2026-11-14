# Neovim Configuration

Personal Neovim configuration. The entry point is `init.lua`; plugin configuration lives in `lua/plugins/` and plugins are managed with Neovim's built-in `vim.pack`.

`mini.pairs` automatically inserts matching closing quotes and brackets while typing in Insert mode.

## External Dependencies

| Tool | Purpose | Required for |
| --- | --- | --- |
| Neovim with `vim.pack` support | Editor and plugin management | Running this configuration |
| Git | Fetching plugins with `vim.pack` and running Git pickers | Plugin installation and Git features |
| `fzf` | Fuzzy matching interface for `fzf-lua` | Fuzzy finders |
| `ripgrep` (`rg`) | Text search in `fzf-lua`; required for grep pickers on Windows | Search pickers |
| `lua-language-server` | Lua completion, diagnostics, and navigation through `lua_ls` | Lua LSP features |
| `stylua` | Formatting Lua files through `conform.nvim` | Lua formatting |
| `fd` | Faster file discovery in `fzf-lua` | Optional file-finder enhancement |
| `bat` | File previews in `fzf-lua` | File previews |

Make sure required executables are available in the `PATH` used to launch Neovim. Plugins are fetched from Git repositories on first install, so Git access to those repositories is also needed.
