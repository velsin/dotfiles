return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      }
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {}
        },
        extensions = {
          fzf = {}
        },
      }

      require('telescope').load_extension('fzf')

      -- (f)ind (h)elp
      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
      -- (f)ind in (d)irectory
      vim.keymap.set("n", "<space>fd",
        function()
          require('telescope.builtin').find_files {
          }
        end
      )
      -- (e)dit co(n)fig
      vim.keymap.set("n", "<space>en",
        function()
          require('telescope.builtin').find_files {
            cwd = vim.fn.stdpath("config")
          }
        end
      )
      -- (e)dit (p)ackages
      vim.keymap.set("n", "<space>ep",
        function()
          require('telescope.builtin').find_files {
            cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
          }
        end
      )
      -- Imports our custom (f)ind (g)reg picker
      require("config.telescope.multigrep").setup()
    end
  }
}
