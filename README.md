# Neovim Configuration

Personal Neovim configuration. The entry point is `init.lua`; plugin configuration lives in `lua/plugins/` and plugins are managed with Neovim's built-in `vim.pack`.

`mini.pairs` automatically inserts matching closing quotes and brackets while typing in Insert mode. `mini.icons` provides filetype icons and a compatibility layer for plugins that use the `nvim-web-devicons` API.

`todo-comments.nvim` highlights code comments such as `TODO:` and `FIXME:`. Use `<leader>fT` to search TODO comments in the project with `fzf-lua`, or `]t` and `[t` to jump to the next and previous comments.

`lualine.nvim` displays the statusline, including LSP task progress from `lsp-progress.nvim`.

`bufferline.nvim` displays open buffers in a tabline. Use `]b` and `[b` to move between buffers, `<leader>x` to close the current buffer, `<leader>bb` to pick a buffer, `<leader>bc` to close other buffers, and `<leader>bd` to pick buffers to close.

`nvim-lspconfig` enables `lua_ls` for Lua and `clangd` for C/C++.

When an LSP attaches, `gd` finds definitions, `gD` declarations, `gy` type definitions, `gi` implementations, `gO` document symbols, and `gr` references. All six mappings use `fzf-lua`.

`<leader>la` opens LSP code actions with `fzf-lua`; `<leader>lr` renames the symbol using the floating input prompt provided by `snacks.input`. The input module replaces `vim.ui.input` throughout Neovim.

`rustaceanvim` is constrained to version 9.x and manages rust-analyzer for Rust files. Automatic checks use `cargo check` instead of Clippy. In Rust buffers, `<leader>la` opens its grouped code actions and `K` shows hover actions. Navigation and rename mappings use the standard LSP interface with rustaceanvim's client.

`nvim-treesitter` provides highlighting for Rust, Lua, C/C++, Python, Bash, Bazel/Starlark, HTML, CSS, JavaScript/JSX, TypeScript/TSX, JSON, YAML, TOML, Vimscript, and Markdown, including code blocks in LSP hover windows. Its parser list and highlighting configuration live in `lua/plugins/nvim-treesitter.lua`. Startup installs only missing parsers; existing parsers are skipped. Run `:TSUpdate` after updating the plugin to keep parsers compatible.

`fzf-lua` uses `bat` for file previews with the `Catppuccin Macchiato` theme, matching the editor's colorscheme. The installed `bat` must include this theme (`bat --list-themes`).

Plugin and configuration choices are informed by current practices in established Neovim distributions such as LazyVim, AstroNvim, NvChad, and LunarVim, adapted to this configuration's needs.

## External Dependencies

| Tool | Purpose | Required for |
| --- | --- | --- |
| Neovim 0.12+ | Editor and plugin management | Running this configuration |
| Git | Fetching plugins with `vim.pack` and running Git pickers | Plugin installation and Git features |
| `fzf` | Fuzzy matching interface for `fzf-lua` | Fuzzy finders |
| `ripgrep` (`rg`) | Text search in `fzf-lua`; required for grep pickers on Windows | Search pickers |
| `lua-language-server` | Lua completion, diagnostics, and navigation through `lua_ls` | Lua LSP features |
| `clangd` | C/C++ completion, diagnostics, and navigation | C/C++ LSP features |
| `rust-analyzer` | Rust completion, diagnostics, and navigation through `rustaceanvim` | Rust LSP features |
| `tree-sitter` CLI 0.26.1+ | Build Tree-sitter parsers; install through a package manager, not npm | Parser installation and updates |
| C compiler, `curl`, `tar` | Download and compile Tree-sitter parsers | Parser installation and updates |
| `stylua` | Formatting Lua files through `conform.nvim` | Lua formatting |
| `fd` | Faster file discovery in `fzf-lua` | Optional file-finder enhancement |
| `bat` | File previews in `fzf-lua` | File previews |

Make sure required executables are available in the `PATH` used to launch Neovim. Plugins are fetched from Git repositories on first install, so Git access to those repositories is also needed.
