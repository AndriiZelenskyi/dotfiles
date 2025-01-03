return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      '<leader>we',
      '<cmd>Yazi<cr>',
      desc = 'Open yazi at the current file directory',
    },
    {
      -- Open in the current working directory
      '<leader>wr',
      '<cmd>Yazi cwd<cr>',
      desc = 'Open the file manager in [W]orking [Root]',
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = true,
    keymaps = {
      show_help = '<f1>',
    },
  },
}
