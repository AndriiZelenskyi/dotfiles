return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('refactoring').setup {
      show_success_message = true,
    }
    -- load refactoring Telescope extension
    require('telescope').load_extension 'refactoring'

    vim.keymap.set({ 'n', 'x' }, '<leader>rr', function()
      require('telescope').extensions.refactoring.refactors()
    end)

    vim.keymap.set({ 'n', 'x' }, '<leader>re', function()
      return require('refactoring').refactor 'Extract Function'
    end, { expr = true })
    vim.keymap.set({ 'n', 'x' }, '<leader>rf', function()
      return require('refactoring').refactor 'Extract Function To File'
    end, { expr = true })
    vim.keymap.set({ 'n', 'x' }, '<leader>rv', function()
      return require('refactoring').refactor 'Extract Variable'
    end, { expr = true })
    vim.keymap.set({ 'n', 'x' }, '<leader>rI', function()
      return require('refactoring').refactor 'Inline Function'
    end, { expr = true })
    vim.keymap.set({ 'n', 'x' }, '<leader>ri', function()
      return require('refactoring').refactor 'Inline Variable'
    end, { expr = true })

    vim.keymap.set({ 'n', 'x' }, '<leader>rbb', function()
      return require('refactoring').refactor 'Extract Block'
    end, { expr = true })
    vim.keymap.set({ 'n', 'x' }, '<leader>rbf', function()
      return require('refactoring').refactor 'Extract Block To File'
    end, { expr = true })

    -- Print var
    vim.keymap.set({ 'x', 'n' }, '<leader>pv', function()
      require('refactoring').debug.print_var()
    end)

    vim.keymap.set({ 'x', 'n' }, '<leader>pp', function()
      require('refactoring').debug.printf()
    end)
    -- Supports both visual and normal mode
    vim.keymap.set('n', '<leader>pc', function()
      require('refactoring').debug.cleanup {}
    end)
    -- Supports only normal mode
  end,
}
