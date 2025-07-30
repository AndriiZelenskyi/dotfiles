return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    expose_as_code_action = 'all',
    jsx_close_tag = {
      enable = true,
      filetypes = { 'javascriptreact', 'typescriptreact' },
    },
    tsserver_max_memory = '5512',
  },
}
