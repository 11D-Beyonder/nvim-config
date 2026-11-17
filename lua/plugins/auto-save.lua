vim.pack.add { 'https://github.com/okuuva/auto-save.nvim' }

require('auto-save').setup {
  debounce_delay = 1000,
  trigger_events = {
    -- Include Insert-mode changes so pausing while typing also saves.
    defer_save = { 'TextChanged', 'TextChangedI', 'TextChangedP', 'InsertLeave' },
    cancel_deferred_save = {},
  },
  condition = function(buf) return vim.bo[buf].buftype == '' and not vim.bo[buf].readonly and vim.api.nvim_buf_get_name(buf) ~= '' end,
}
