print("nvim config wip")

require("config.lazy")

-- Options
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard:append("unnamedplus")

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Custom Keybinds

-- Use jk to scroll in quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- open a (s)mall (t)erminal
vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end
)

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Use OSC 52 clipboard
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = function()
      return {
        vim.fn.split(vim.fn.getreg(""), "\n"),
        vim.fn.getregtype(""),
      }
    end,
    ['*'] = function()
      return {
        vim.fn.split(vim.fn.getreg(""), "\n"),
        vim.fn.getregtype(""),
      }
    end,
  },
}

-- Configure Diagnostic display settings
--
-- Lua configuration (init.lua or a file in your lua/config/ directory)
local signs = {
  Error = { text = "E", texthl = "DiagnosticSignError" },
  Warn = { text = "W", texthl = "DiagnosticSignWarn" },
  Info = { text = "I", texthl = "DiagnosticSignInfo" },
  Hint = { text = "H", texthl = "DiagnosticSignHint" },
}

--for type, sign in pairs(signs) do
--  vim.fn.sign_define("LspDiagnosticsSign" .. type, {
--    text = sign.text,
--    texthl = sign.texthl,
--  })
--end
--
vim.diagnostic.config({
  signs = true,
  underline = true,
  update_in_insert = false,
  virtual_text = false,
  virtual_lines = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
  }
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
