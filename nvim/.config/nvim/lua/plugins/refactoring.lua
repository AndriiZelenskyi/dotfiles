return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'lewis6991/async.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>rr', function() require('refactoring').select_refactor() end, mode = { 'n', 'x' }, desc = '[R]efactor menu' },
    { '<leader>re', function() return require('refactoring').extract_func() end, mode = { 'n', 'x' }, expr = true, desc = '[R]efactor [E]xtract function' },
    { '<leader>rf', function() return require('refactoring').extract_func_to_file() end, mode = { 'n', 'x' }, expr = true, desc = '[R]efactor extract [F]unction to file' },
    { '<leader>rv', function() return require('refactoring').extract_var() end, mode = { 'n', 'x' }, expr = true, desc = '[R]efactor extract [V]ariable' },
    { '<leader>rI', function() return require('refactoring').inline_func() end, mode = { 'n', 'x' }, expr = true, desc = '[R]efactor [I]nline function' },
    { '<leader>ri', function() return require('refactoring').inline_var() end, mode = { 'n', 'x' }, expr = true, desc = '[R]efactor [i]nline variable' },
    { '<leader>pv', function() return require('refactoring.debug').print_var { output_location = 'below' } .. 'iw' end, mode = { 'n', 'x' }, expr = true, desc = '[P]rint [V]ariable' },
    { '<leader>pp', function() return require('refactoring.debug').print_loc { output_location = 'below' } end, mode = { 'n', 'x' }, expr = true, desc = '[P]rint location' },
    { '<leader>pe', function() return require('refactoring.debug').print_exp { output_location = 'below' } end, mode = { 'n', 'x' }, expr = true, desc = '[P]rint [E]xpression' },
    {
      '<leader>pc',
      function()
        require('refactoring.debug').cleanup { restore_view = true }
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('ggg@G', true, false, true), 'n', false)
      end,
      mode = 'n',
      desc = '[P]rint [C]leanup (whole file)',
    },
  },
  opts = { show_success_message = true },
}
