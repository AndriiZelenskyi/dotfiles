-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin-latte'
    end,
  },
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        session_lens = {
          buftypes_to_ignore = {},
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      }

      vim.keymap.set('n', '<Leader>ls', require('auto-session.session-lens').search_session, {
        noremap = true,
      })
    end,
  },
  {
    'napmn/react-extract.nvim',
    config = function()
      require('react-extract').setup()
    end,
    init = function()
      vim.keymap.set({ 'v' }, '<Leader>rfe', require('react-extract').extract_to_new_file)
      vim.keymap.set({ 'v' }, '<Leader>re', require('react-extract').extract_to_current_file)
    end,
  },
  {
    'FabijanZulj/blame.nvim',
    lazy = false,
    config = function()
      require('blame').setup {}
    end,
  },
}
