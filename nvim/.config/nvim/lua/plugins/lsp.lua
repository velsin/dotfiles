return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      }
    },
    config = function()
      vim.lsp.enable('lua_ls')
      vim.lsp.config('ruff', {
        init_options = {
          settings = {
            configurationPreference = "filesystemFirst",
            lineLength = 100
          }
        }
      })
      vim.lsp.enable('ruff')
      vim.lsp.enable('pyright')
      vim.lsp.config('terraformls', {
        cmd = { 'terraform-ls', 'serve', '-log-file=/dev/null' }
      })
      vim.lsp.enable('terraformls')
      vim.lsp.enable('gopls')
      vim.lsp.config('yamlls', {
        settings = {
          yaml = {
            format = {
              enable = true,
              singleQuote = false,
            }
          }
        }
      })
      vim.lsp.enable('yamlls')

      -- Set up autoformat on save
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
          end

          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer when saving
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })


      -- Change default gotodef behavior
      -- (g)o to (D)eclaration
      vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
      -- (g)o to (d)efinition
      vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
    end,
  }
}
