vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'i', 'v' }, 'jk', '<Esc>', { desc = 'Escape' })
vim.keymap.set({ 'n', 'i', 'v' }, 'jk', '<Esc>', { desc = 'Escape' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[buffer navigation]]

-- Move between buffers with [b and ]b

vim.keymap.set('n', '[b', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<CR>', { desc = 'Next buffer' })

-- navigate with buffers using interactive popup
vim.keymap.set('n', '<leader>bb', '<cmd>Telescope buffers<CR>', { desc = 'Find buffer' })
-- closing buffers with all and except current
vim.keymap.set('n', '<leader>bC', '<cmd>bufdo bd<CR>', { desc = 'Close all buffers' })
vim.keymap.set('n', '<leader>bc', '<cmd>BufOnly silent! execute "%bd|e#|bd#"',
  { desc = 'Close all except current buffer' })
