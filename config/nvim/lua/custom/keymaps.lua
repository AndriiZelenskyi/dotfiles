vim.keymap.set('n', '<leader>we', ':Ex<CR>', { desc = '[W]orkspace [E]xplore' })

vim.keymap.set('n', '<leader>k', '<C-o>', { desc = 'Move cursor back to previous position' })
vim.keymap.set('n', '<leader>j', '<C-i>', { desc = 'Move cursor back to forward position' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- Eslint
vim.keymap.set('n', '<leader>fe', function()
  vim.cmd 'EslintFixAll'
end, { desc = '[F]ix [E]slint' })
