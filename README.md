# Neovim Configuration

Personal Neovim configuration. The entry point is `init.lua`; plugin configuration lives in `lua/plugins/` and plugins are managed with Neovim's built-in `vim.pack`.

`exrc` enables project-local configuration through `.nvim.lua`, `.nvimrc`, or `.exrc` files. Neovim only executes trusted files; use `:trust` to manage trust.

On Linux over SSH, Neovim uses OSC 52 to copy text to the client terminal's clipboard, so `yy` can copy a line to your Mac. Both iTerm2 and WezTerm support this; in iTerm2, enable **Settings → General → Selection → Applications in terminal may access clipboard**. Other environments retain automatic clipboard provider selection. Paste from the Mac with `⌘V`: WezTerm ignores OSC 52 clipboard read requests, so Neovim's `p` can wait and time out.

`mini.pairs` automatically inserts matching closing quotes and brackets while typing in Insert mode. `mini.icons` provides filetype icons and a compatibility layer for plugins that use the `nvim-web-devicons` API.

`snacks.indent` draws indentation guides with `┃` and highlights the current scope. `rainbow-delimiters.nvim` colors matching delimiters by nesting level in supported Tree-sitter languages.

`todo-comments.nvim` highlights code comments such as `TODO:` and `FIXME:`. Use `<leader>fT` to search TODO comments in the project with Snacks Picker, or `]t` and `[t` to jump to the next and previous comments.

`lualine.nvim` displays the statusline, including the latest LSP task progress from Noice. Progress appears only in the statusline and clears when the task finishes. The right side shows Noice's pending command, mode/recording status, and search count, plus file position. Encoding, file format, filetype, and recent messages are omitted to keep the statusline compact.

`bufferline.nvim` displays open buffers in a tabline. Use `]b` and `[b` to move between buffers, `<leader>x` to close the current buffer, `<leader>bb` to pick a buffer, `<leader>bc` to close other buffers, and `<leader>bd` to pick buffers to close.

In Normal mode, press `Space` then `e` to toggle NvimTree. Press `Space` then `Shift+E` from a file buffer to open the tree if needed and move the cursor to the current file's entry.

`auto-save.nvim` saves named, writable file buffers 1 second after the last change, including while in Insert mode. It also saves immediately when leaving a buffer, losing focus, quitting, or suspending Neovim. Use `:ASToggle` to toggle auto-save. Unnamed buffers need an initial manual save to choose a filename. Following AstroCommunity's approach, automatic saves skip Conform formatting while manual saves still format; other write events remain enabled.

`nvim-lspconfig` enables `lua_ls` for Lua and `clangd` for C/C++.

Neovim displays inlay hints by default in any buffer where an attached language server provides them.

`:LspInfo` opens `:checkhealth vim.lsp`. `:LspRestart` runs `:lsp restart` to restart active LSP clients attached to the current buffer; pass a server name, such as `:LspRestart lua_ls`, to restart that server. Server names support command-line completion. These aliases are defined in `lua/plugins/nvim-lspconfig.lua`.

When an LSP attaches, `gd` finds definitions, `gD` declarations, `gy` type definitions, `gi` implementations, `gO` document symbols, and `gr` references. All six mappings use Snacks Picker.
`gr` triggers immediately, taking precedence over Neovim's longer `gr` mappings in normal mode. Press `<CR>` to jump to the selected reference, or let the picker jump directly when there is only one result.

`<leader>la` opens native LSP code actions through Snacks Picker (`vim.ui.select`); `<leader>lr` renames the symbol using the floating input prompt provided by `snacks.input`. The input module replaces `vim.ui.input` throughout Neovim.

In Normal mode, press `Space` then `-` to split below, or `Space` then `|` to split to the right. `Ctrl` + arrow keys move split boundaries through `smart-splits.nvim`. Press `Ctrl` + `+` to zoom the current window with Snacks, and press it again to return to the split layout.

`snacks.terminal` provides terminals with AstroNvim-style shortcuts (`<leader>` is Space):

| Shortcut | Action |
| --- | --- |
| `<C-'>` | Hide the current Snacks terminal, or toggle the bottom terminal from an editor buffer; available in Normal, Insert, and Terminal modes |
| `<leader>tf` | Toggle a floating terminal |
| `<leader>th` | Toggle a bottom terminal, 10 lines high |
| `<leader>tv` | Toggle a right terminal, 80 columns wide |
| `<leader>tn` | Create a new bottom terminal alongside any existing bottom terminals |
| `<leader>tl` | Select a visible or hidden Snacks terminal with Snacks Picker, then show and focus it |
| `<C-h/j/k/l>` | Move between windows from a split terminal; floating terminals pass these keys to the shell |

Each layout reuses its own shell per working directory; hiding a terminal keeps its process running. Terminals open in Neovim's current working directory and enter input mode automatically. Use Snacks' default double `<Esc>` (or Neovim's `<C-\><C-n>`) to return to Normal mode, and type `exit` in the shell to end it.

`<leader>tn` always creates an independent shell. From a terminal, double `<Esc>` then press `<leader>tn` to add another bottom split. `<leader>tl` lists terminal IDs, visibility, titles, and starting directories, including terminals from other working directories. Selecting one preserves its shell and layout; cancelling leaves terminals unchanged.

`rustaceanvim` is constrained to version 9.x and manages rust-analyzer for Rust files. Automatic checks use `cargo check` instead of Clippy. In Rust buffers, `<leader>la` opens its grouped code actions and `K` shows hover actions. Navigation and rename mappings use the standard LSP interface with rustaceanvim's client.

`nvim-treesitter` provides highlighting for Rust, Lua, C/C++, Python, Bash, Bazel/Starlark, HTML, CSS, JavaScript/JSX, TypeScript/TSX, JSON, YAML, TOML, Vimscript, Markdown, and LaTeX, including code blocks in LSP hover windows. Its parser list and highlighting configuration live in `lua/plugins/nvim-treesitter.lua`. Startup installs only missing parsers; existing parsers are skipped. Run `:TSUpdate` after updating the plugin to keep parsers compatible.

`render-markdown.nvim` renders Markdown inside Neovim using the plugin's default appearance. Inline `$...$` and block `$$...$$` formulas use `utftex` and the LaTeX parser; the rendered formula replaces its source visually while the file retains the original LaTeX. Use `:RenderMarkdown toggle` to toggle rendering and `:RenderMarkdown preview` to open a side preview. Configuration lives in `lua/plugins/render-markdown.lua`.

`snacks.picker` provides file, text, Git, LSP, help, and undo pickers, plus `vim.ui.select` for selection dialogs. Picker settings live in `lua/plugins/snacks.lua`; search shortcuts live in `lua/keymaps.lua`. Previews use Neovim buffers and the editor's colorscheme.

Search shortcuts: `<leader>ff` finds files, `<leader>fF` includes hidden and ignored files, `<leader>fw` searches project text live, and `<leader>fW` prompts for a search pattern before fuzzy-filtering its results. `<leader>f/` searches the current buffer, including unsaved edits. The previous cross-buffer `<leader>fl` mapping has been removed. `<leader>f<CR>` resumes the previous picker. LSP symbol pickers include all symbol kinds, and `<leader>lD` shows diagnostics across buffers without restricting them to the current directory.

Plugin and configuration choices are informed by current practices in established Neovim distributions such as LazyVim, AstroNvim, NvChad, and LunarVim, adapted to this configuration's needs.

## External Dependencies

| Tool | Purpose | Required for |
| --- | --- | --- |
| Neovim 0.12+ | Editor and plugin management | Running this configuration |
| Git | Fetching plugins with `vim.pack` and running Git pickers | Plugin installation and Git features |
| `ripgrep` (`rg`) | Text search in Snacks Picker | Search pickers |
| `lua-language-server` | Lua completion, diagnostics, and navigation through `lua_ls` | Lua LSP features |
| `clangd` | C/C++ completion, diagnostics, and navigation | C/C++ LSP features |
| `rust-analyzer` | Rust completion, diagnostics, and navigation through `rustaceanvim` | Rust LSP features |
| `tree-sitter` CLI 0.26.1+ | Build Tree-sitter parsers; install through a package manager, not npm | Parser installation and updates |
| C compiler, `curl`, `tar` | Download and compile Tree-sitter parsers | Parser installation and updates |
| `utftex` (from `libtexprintf`) | Render LaTeX as Unicode formulas | Formula previews in Markdown |
| `stylua` | Formatting Lua files through `conform.nvim` | Lua formatting |
| `fd` | File discovery in Snacks Picker | Optional file-finder enhancement |

Make sure required executables are available in the `PATH` used to launch Neovim. Plugins are fetched from Git repositories on first install, so Git access to those repositories is also needed.
