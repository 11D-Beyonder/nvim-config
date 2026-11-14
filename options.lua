-- General Neovim options.

-- Set these before plugins load so their mappings use the intended leader keys.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the built-in netrw file explorer; nvim-tree is used instead.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse support in all modes.
vim.o.mouse = 'a'

-- Show the current mode (such as INSERT or VISUAL) in the command area.
vim.o.showmode = true

-- Sync Neovim's unnamed register with the operating system clipboard.
-- Schedule this after startup because clipboard initialization can add startup time.
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Indent wrapped screen lines to match the start of the text on the original line.
-- For example, when a long line wraps, its continuation aligns with the text:
--   Without breakindent:  print("a long line that wraps...")
--                         continuation starts at the screen's left edge
--   With breakindent:     print("a long line that wraps...")
--                               continuation aligns with the code
-- This only changes display; it does not insert whitespace into the file.
vim.o.breakindent = true

-- Enable undo/redo changes even after closing and reopening a file.
vim.o.undofile = true

-- Ignore case in searches unless the pattern contains an uppercase letter.
-- Use \C in a search pattern to force case-sensitive matching.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Always reserve the sign column to the left of the line numbers for markers
-- such as diagnostics, Git changes, or breakpoints.
-- Example: an error marker can appear there without shifting the code to the right.
vim.o.signcolumn = 'yes'

-- Wait 250 ms after the last keystroke before running certain timed updates.
-- Example: diagnostics or Git signs can refresh shortly after you pause typing.
-- This is not autosave; it also affects when the swap file is written.
vim.o.updatetime = 250

-- Open new vertical splits on the right; for example, `:vsplit` puts the new
-- window to the right of the current one.
vim.o.splitright = true
-- Open new horizontal splits below; for example, `:split` puts the new
-- window below the current one.
vim.o.splitbelow = true

-- Show normally invisible whitespace characters in the editor.
-- For example, tabs appear as `»`, extra spaces at the end of a line as `·`,
-- and non-breaking spaces as `␣`. These are display symbols; the file text is unchanged.
vim.o.list = true
-- Choose the display symbol for each whitespace character type.
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview a substitution while typing the command, in a temporary split window.
-- Example: as you enter `:%s/cat/dog/g`, matching `cat` text previews as `dog`.
-- Press Enter to apply the replacement, or Esc to cancel without changing the text.
vim.o.inccommand = 'split'

-- Highlight the entire screen line where the cursor is located.
-- Example: when the cursor moves from line 12 to line 13, the highlight follows it.
-- This changes only the editor display, not the file contents.
vim.o.cursorline = true

-- Keep at least 10 screen lines visible above and below the cursor when possible.
-- Example: moving the cursor near the bottom scrolls the window before it reaches the edge,
-- leaving about 10 lines of context below it (and similarly above it).
vim.o.scrolloff = 10

-- Ask before an operation discards unsaved changes.
-- Example: `:q` on a modified buffer prompts whether to save, discard, or cancel.
vim.o.confirm = true

-- Enable 24-bit true color so themes can use a wide range of colors.
-- Example: syntax highlighting and theme backgrounds can show precise shades
-- instead of being limited to the terminal's basic 16 or 256 color palette.
-- The terminal must support true color for the full effect to appear.
vim.o.termguicolors = true

-- Use this font in Neovide, the graphical Neovim client.
if vim.g.neovide then vim.opt.guifont = 'Maple_Mono_NF_CN,JetBrains_Mono,Fira_Code:h12' end
