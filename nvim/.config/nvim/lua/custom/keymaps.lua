vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.keymap.set('n', '<leader>we', ':Explore<CR>', { desc = '[W]orkspace [E]xplore' })

vim.keymap.set('n', '<leader>k', '<C-o>', { desc = 'Move cursor back to previous position' })
vim.keymap.set('n', '<leader>j', '<C-i>', { desc = 'Move cursor back to forward position' })

-- Diagnostic keymaps
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Next diagnostic' })

vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Prev diagnostic' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>cq', ':lclose<CR>', { desc = '[C]lose diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

vim.keymap.set('n', '<leader>fi', function()
  vim.cmd '!pnpm run lint --write --unsafe'
end)
