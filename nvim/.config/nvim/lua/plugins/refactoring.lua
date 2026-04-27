return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>rr', function() require('refactoring').select_refactor() end, mode = { 'n', 'x' }, desc = '[R]efactor menu' },
    { '<leader>re', function() return require('refactoring').refactor 'Extract Function' end, mode = { 'n', 'x' }, expr = true, desc = '[R]efactor [E]xtract function' },
    { '<leader>rf', function() return require('refactoring').refactor 'Extract Function To File' end, mode = { 'n', 'x' }, expr = true, desc = '[R]efactor extract [F]unction to file' },
    { '<leader>rv', function() return require('refactoring').refactor 'Extract Variable' end, mode = { 'n', 'x' }, expr = true, desc = '[R]efactor extract [V]ariable' },
    { '<leader>rI', function() return require('refactoring').refactor 'Inline Function' end, mode = { 'n', 'x' }, expr = true, desc = '[R]efactor [I]nline function' },
    { '<leader>ri', function() return require('refactoring').refactor 'Inline Variable' end, mode = { 'n', 'x' }, expr = true, desc = '[R]efactor [i]nline variable' },
    { '<leader>rbb', function() return require('refactoring').refactor 'Extract Block' end, mode = { 'n', 'x' }, expr = true, desc = '[R]efactor extract [B]lock' },
    { '<leader>rbf', function() return require('refactoring').refactor 'Extract Block To File' end, mode = { 'n', 'x' }, expr = true, desc = '[R]efactor extract [B]lock to [F]ile' },
    { '<leader>pv', function() require('refactoring').debug.print_var() end, mode = { 'n', 'x' }, desc = '[P]rint [V]ariable' },
    { '<leader>pp', function() require('refactoring').debug.printf() end, mode = { 'n', 'x' }, desc = '[P]rint [P]rintf' },
    { '<leader>pc', function() require('refactoring').debug.cleanup {} end, mode = 'n', desc = '[P]rint [C]leanup' },
  },
  opts = { show_success_message = true },
}
