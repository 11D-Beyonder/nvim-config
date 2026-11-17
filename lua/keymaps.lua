vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

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
  require('fzf-lua.providers.ui_select').ui_select(terminals, {
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
      -- Enter input mode after fzf-lua finishes restoring Terminal-Normal mode.
      vim.api.nvim_feedkeys(vim.keycode '<C-\\><C-n>i', 'n', false)
    end
  end)
end, { desc = 'List terminals' })

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file [e]xplore' })

vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = '[Q]uit' })
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite' })
