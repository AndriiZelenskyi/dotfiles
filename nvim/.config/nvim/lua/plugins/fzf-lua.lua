return {
  'ibhagwan/fzf-lua',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local fzf = require 'fzf-lua'
    fzf.setup { 'default-title' }
    fzf.register_ui_select()

    local map = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { desc = desc })
    end

    map('<leader>sh', fzf.helptags, '[S]earch [H]elp')
    map('<leader>sk', fzf.keymaps, '[S]earch [K]eymaps')
    map('<leader>sf', fzf.files, '[S]earch [F]iles')
    map('<leader>ss', fzf.builtin, '[S]earch [S]elect fzf-lua')
    map('<leader>sw', fzf.grep_cword, '[S]earch current [W]ord')
    map('<leader>sg', fzf.live_grep, '[S]earch by [G]rep')
    map('<leader>sd', fzf.diagnostics_workspace, '[S]earch [D]iagnostics')
    map('<leader>sr', fzf.resume, '[S]earch [R]esume')
    map('<leader>s.', fzf.oldfiles, '[S]earch Recent Files ("." for repeat)')
    map('<leader><leader>', fzf.buffers, '[ ] Find existing buffers')

    map('<leader>/', function()
      fzf.blines { winopts = { preview = { hidden = 'hidden' } } }
    end, '[/] Fuzzily search in current buffer')

    map('<leader>sn', function()
      fzf.files { cwd = vim.fn.stdpath 'config' }
    end, '[S]earch [N]eovim files')

    map('<leader>s/', function()
      local files = {}
      for _, b in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(b) and vim.bo[b].buflisted then
          local name = vim.api.nvim_buf_get_name(b)
          if name ~= '' then
            files[#files + 1] = vim.fn.fnameescape(name)
          end
        end
      end
      fzf.live_grep {
        cmd = 'rg --column --line-number --no-heading --color=always -- ' .. table.concat(files, ' '),
        prompt_title = 'Live Grep in Open Files',
      }
    end, '[S]earch [/] in Open Files')
  end,
}
