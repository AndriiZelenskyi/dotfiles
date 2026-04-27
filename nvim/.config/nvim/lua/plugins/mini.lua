return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      -- Sane defaults, basic mappings, autocommands
      require('mini.basics').setup {
        options = { extra_ui = true, win_borders = 'single' },
        mappings = { windows = true, move_with_alt = true },
      }

      -- Text objects: better a/i (e.g. va), ci', etc.)
      require('mini.ai').setup()

      -- ysiw", cs"', ds" — surround operations
      require('mini.surround').setup()

      -- Auto-close brackets/quotes
      require('mini.pairs').setup()

      -- Move lines/blocks with Alt-hjkl in normal/visual
      require('mini.move').setup()

      -- [b ]b ]q [q [d ]d — bracket motions for buffers, quickfix, diagnostics
      require('mini.bracketed').setup()

      -- gS to split/join argument lists
      require('mini.splitjoin').setup()

      -- Highlight TODO/FIXME/HACK + hex colors inline
      local hi = require 'mini.hipatterns'
      hi.setup {
        highlighters = {
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
          hex_color = hi.gen_highlighter.hex_color(),
        },
      }

      -- Icons (provider for nvim-web-devicons consumers too)
      require('mini.icons').setup()
      MiniIcons.mock_nvim_web_devicons()

      -- Statusline
      require('mini.statusline').setup { use_icons = true }

      -- Notifications (replaces vim.notify)
      require('mini.notify').setup()
      vim.notify = require('mini.notify').make_notify()

      -- File explorer (open with `-` like oil.nvim style)
      require('mini.files').setup {
        windows = { preview = true, width_preview = 80 },
      }
      vim.keymap.set('n', '-', function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0))
      end, { desc = 'Open mini.files' })

      -- Git signs in the gutter + :Git wrapper
      require('mini.diff').setup()
      require('mini.git').setup()

      -- Snippets (uses vim.snippet under the hood)
      require('mini.snippets').setup()
    end,
  },
}
