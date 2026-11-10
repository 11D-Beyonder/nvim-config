require("gitsigns").setup {
  signs = {
    add          = { text = '┃' }, -- Sign for added lines in the working tree.
    change       = { text = '┃' }, -- Sign for changed lines in the working tree.
    delete       = { text = '_' }, -- Sign for deleted lines in the working tree.
    topdelete    = { text = '‾' }, -- Sign for deleted lines at the top of the file.
    changedelete = { text = '~' }, -- Sign for changed lines that also include deletions.
    untracked    = { text = '┆' }, -- Sign for added lines in an untracked file.
  },
  signs_staged = {
    add          = { text = '┃' }, -- Sign for staged added lines.
    change       = { text = '┃' }, -- Sign for staged changed lines.
    delete       = { text = '_' }, -- Sign for staged deleted lines.
    topdelete    = { text = '‾' }, -- Sign for staged deletions at the top of the file.
    changedelete = { text = '~' }, -- Sign for staged changes that also include deletions.
    untracked    = { text = '┆' }, -- Sign for added lines in a staged untracked file.
  },
  signs_staged_enable = true, -- Show signs for staged changes.
  signcolumn = true, -- Show Git signs in the sign column; toggle with :Gitsigns toggle_signs.
  numhl = false, -- Do not highlight line numbers for changed lines; toggle with :Gitsigns toggle_numhl.
  linehl = false, -- Do not highlight entire changed lines; toggle with :Gitsigns toggle_linehl.
  word_diff = false, -- Do not highlight changed words within changed lines; toggle with :Gitsigns toggle_word_diff.
  watch_gitdir = {
    follow_files = true, -- Keep tracking files when they are moved or renamed.
  },
  auto_attach = true, -- Automatically attach Gitsigns to buffers in Git repositories.
  attach_to_untracked = false, -- Do not automatically attach to untracked files.
  current_line_blame = true, -- Show blame for the cursor line; toggle with :Gitsigns toggle_current_line_blame.
  current_line_blame_opts = {
    virt_text = true, -- Display blame as virtual text without changing the buffer.
    virt_text_pos = 'eol', -- Place blame at end of line; also supports 'overlay' and 'right_align'.
    delay = 300, -- Wait this many milliseconds after cursor movement before showing blame.
    ignore_whitespace = false, -- Include whitespace-only changes when finding blame.
    virt_text_priority = 100, -- Set the display priority of the blame virtual text.
    use_focus = true, -- Show blame only while this window has focus.
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>', -- Format current-line blame with author, relative time, and commit summary.
  blame_formatter = nil, -- Use the plugin's default formatter for other blame output.
  sign_priority = 6, -- Set the priority of Git signs relative to signs from other plugins.
  update_debounce = 100, -- Wait this many milliseconds before refreshing after changes.
  status_formatter = nil, -- Use the plugin's default formatter for b:gitsigns_status.
  max_file_length = 40000, -- Disable Gitsigns for files longer than this many lines.
  preview_config = { -- Set default floating-window options for Gitsigns previews.
    style = 'minimal', -- Options: '' (no special style) or 'minimal'.
    relative = 'cursor', -- Options: 'cursor', 'editor', 'win', 'mouse', 'laststatus', or 'tabline'.
    row = 0, -- Offset the preview vertically from the cursor.
    col = 1, -- Offset the preview horizontally from the cursor.
  },
}
