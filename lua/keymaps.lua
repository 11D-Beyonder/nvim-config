local picker = Snacks.picker

vim.keymap.set('n', '<leader>f<CR>', picker.resume, { desc = 'Resume previous search' })
vim.keymap.set('n', '<leader>fa', function() picker.files { cwd = vim.fn.stdpath 'config' } end, { desc = 'Find Neovim config files' })
vim.keymap.set('n', '<leader>fb', picker.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fc', picker.grep_word, { desc = 'Search word under cursor' })
vim.keymap.set('n', '<leader>fC', picker.commands, { desc = 'Find commands' })
vim.keymap.set('n', '<leader>ff', picker.files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fF', function() picker.files { hidden = true, ignored = true } end, { desc = 'Find all files' })
vim.keymap.set('n', '<leader>fg', picker.git_files, { desc = 'Find Git files' })
vim.keymap.set('n', '<leader>fh', picker.help, { desc = 'Find help' })
vim.keymap.set('n', '<leader>fk', picker.keymaps, { desc = 'Find keymaps' })
vim.keymap.set('n', '<leader>fm', picker.man, { desc = 'Find man pages' })
vim.keymap.set('n', '<leader>fo', picker.recent, { desc = 'Find recent files' })
vim.keymap.set('n', '<leader>fO', function() picker.recent { filter = { cwd = true } } end, { desc = 'Find recent files in cwd' })
vim.keymap.set('n', "<leader>f'", picker.marks, { desc = 'Find marks' })
vim.keymap.set('n', '<leader>fr', picker.registers, { desc = 'Find registers' })
vim.keymap.set('n', '<leader>fs', picker.lsp_symbols, { desc = 'Find document symbols' })
vim.keymap.set('n', '<leader>ft', picker.colorschemes, { desc = 'Find colorschemes' })
vim.keymap.set('n', '<leader>fw', picker.grep, { desc = 'Search text in real time' })
vim.keymap.set('n', '<leader>fW', function()
  vim.ui.input({ prompt = 'Search text: ' }, function(search)
    if search then Snacks.picker.grep { search = search, live = false, need_search = false } end
  end)
end, { desc = 'Search text' })
vim.keymap.set('n', '<leader>fu', picker.undo, { desc = 'Find undo history' })

vim.keymap.set('n', '<leader>gb', picker.git_branches, { desc = 'Git branches' })
vim.keymap.set('n', '<leader>gc', picker.git_log, { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gC', picker.git_log_file, { desc = 'Git commits for current file' })
vim.keymap.set('n', '<leader>gt', picker.git_status, { desc = 'Git status' })
vim.keymap.set('n', '<leader>gT', picker.git_stash, { desc = 'Git stash' })

vim.keymap.set('n', '<leader>lD', picker.diagnostics, { desc = 'Workspace diagnostics' })
vim.keymap.set('n', '<leader>ls', picker.lsp_symbols, { desc = 'Document symbols' })

vim.keymap.set('n', '<leader>fT', function() picker.todo_comments() end, { desc = 'Find TODO comments' })

vim.keymap.set('n', '<leader>f/', picker.lines, { desc = 'Find lines in current buffer' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>-', '<C-w>s', { desc = 'Split window below' })
vim.keymap.set('n', '<leader>|', '<C-w>v', { desc = 'Split window right' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

local smart_splits = require 'smart-splits'
vim.keymap.set('n', '<C-Up>', smart_splits.resize_up, { desc = 'Resize split up' })
vim.keymap.set('n', '<C-Down>', smart_splits.resize_down, { desc = 'Resize split down' })
vim.keymap.set('n', '<C-Left>', smart_splits.resize_left, { desc = 'Resize split left' })
vim.keymap.set('n', '<C-Right>', smart_splits.resize_right, { desc = 'Resize split right' })
vim.keymap.set('n', '<C-+>', Snacks.zen.zoom, { desc = 'Toggle Zoom Mode' })

-- Keep shell shortcuts in floating terminals, as AstroNvim does.
for _, direction in ipairs { 'h', 'j', 'k', 'l' } do
  vim.keymap.set('t', '<C-' .. direction .. '>', function()
    if vim.api.nvim_win_get_config(0).zindex then return '<C-' .. direction .. '>' end
    return '<C-\\><C-n><C-w>' .. direction
  end, { expr = true, desc = 'Move focus from terminal ' .. direction })
end

vim.keymap.set({ 'n', 't', 'i' }, "<C-'>", function()
  for _, terminal in ipairs(Snacks.terminal.list()) do
    if terminal.buf == vim.api.nvim_get_current_buf() then
      terminal:hide()
      return
    end
  end
  Snacks.terminal.toggle(nil, { count = 1, win = { position = 'bottom', height = 10 } })
end, { desc = 'Toggle terminal' })

-- Separate IDs keep each layout's shell alive when it is hidden.
vim.keymap.set(
  'n',
  '<leader>tf',
  function() Snacks.terminal.toggle(nil, { count = 2, win = { position = 'float' } }) end,
  { desc = 'Toggle floating terminal' }
)
vim.keymap.set(
  'n',
  '<leader>th',
  function() Snacks.terminal.toggle(nil, { count = 1, win = { position = 'bottom', height = 10 } }) end,
  { desc = 'Toggle horizontal terminal' }
)
vim.keymap.set(
  'n',
  '<leader>tv',
  function() Snacks.terminal.toggle(nil, { count = 3, win = { position = 'right', width = 80 } }) end,
  { desc = 'Toggle vertical terminal' }
)

vim.keymap.set('n', '<leader>tn', function()
  local count = 3 -- IDs 1–3 belong to the fixed layout shortcuts.
  for _, terminal in ipairs(Snacks.terminal.list()) do
    count = math.max(count, vim.b[terminal.buf].snacks_terminal.id)
  end
  Snacks.terminal.open(nil, { count = count + 1, win = { position = 'bottom', height = 10 } })
end, { desc = 'New terminal' })

vim.keymap.set('n', '<leader>tl', function()
  local terminals = Snacks.terminal.list()
  if #terminals == 0 then
    vim.notify 'No terminals open'
    return
  end
  table.sort(terminals, function(a, b) return a.buf < b.buf end)
  vim.ui.select(terminals, {
    prompt = 'Terminals',
    format_item = function(terminal)
      local cwd = vim.api.nvim_buf_get_name(terminal.buf):match '^term://(.*)//%d+:'
      return ('%d [%s] %s — %s'):format(
        vim.b[terminal.buf].snacks_terminal.id,
        terminal:win_valid() and 'visible' or 'hidden',
        vim.b[terminal.buf].term_title,
        vim.fn.fnamemodify(cwd, ':~')
      )
    end,
  }, function(terminal)
    if terminal and terminal:buf_valid() then
      terminal:show():focus()
      vim.cmd.startinsert()
    end
  end)
end, { desc = 'List terminals' })

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file [e]xplore' })

vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = '[Q]uit' })
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite' })
