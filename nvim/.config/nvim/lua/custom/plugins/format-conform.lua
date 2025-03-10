return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'never' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true, typescriptreact = true }
      local lsp_format_opt = 'never'
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 1000,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      json = { 'jq' },
      sh = { 'shfmt' },
      toml = { 'taplo' },
      yaml = { 'yamlfix' },
      html = { 'prettier' },
      css = { 'prettier' },
      scss = { 'prettier' },
      svg = { 'prettier' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { 'prettier', 'prettierd', 'eslint_d', stop_after_first = true },
      javascript = { 'eslint_d', 'prettier' },
      typescript = { 'eslint_d', 'prettier' },
      javascriptreact = { 'eslint_d', 'prettier' },
      typescriptreact = { 'eslint_d', 'prettier' },
    },
  },
}
