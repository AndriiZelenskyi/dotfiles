return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      -- Install the parsers you want (one-time; it caches)
      require('nvim-treesitter').install {
        'lua',
        'vim',
        'vimdoc',
        'bash',
        'markdown',
        'markdown_inline',
        'query',
        'regex',
        'python',
      }

      -- Turn on highlighting per filetype
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local ok = pcall(vim.treesitter.start, args.buf)
          if ok then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'mason-org/mason.nvim', 'mason-org/mason-lspconfig.nvim', 'saghen/blink.cmp' },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls' }, -- add yours
      }

      -- On 0.11+ you can do this; servers auto-start via mason-lspconfig
      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local map = function(k, fn, desc)
            vim.keymap.set('n', k, fn, { buffer = args.buf, desc = desc })
          end

          map('gd', vim.lsp.buf.definition, 'Goto definition')
          map('gD', vim.lsp.buf.declaration, 'Goto declaration')
          map('gI', vim.lsp.buf.implementation, 'Goto implementation')
          map('<leader>D', vim.lsp.buf.type_definition, 'Type definition')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame symbol')
          vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = args.buf, desc = '[C]ode [A]ction' })

          -- mini.pick-based pickers for symbols (requires mini.extra)
          map('<leader>ds', function()
            MiniExtra.pickers.lsp { scope = 'document_symbol' }
          end, 'Document symbols')
          map('<leader>ws', function()
            MiniExtra.pickers.lsp { scope = 'workspace_symbol' }
          end, 'Workspace symbols')

          -- Inlay hints toggle — only if the server supports it
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, args.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = args.buf })
            end, 'Toggle inlay hints')
          end
        end,
      })
    end,
  },

  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        -- python = { 'ruff_format' },
        -- javascript = { 'prettierd', 'prettier', stop_after_first = true },
      },
      format_on_save = { timeout_ms = 1000, lsp_format = 'fallback' },
    },
  },

  -- Linting
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost', 'BufWritePost' },
    config = function()
      require('lint').linters_by_ft = {
        -- python = { 'ruff' },
        -- javascript = { 'eslint_d' },
      }
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
