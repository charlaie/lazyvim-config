-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<ESC>", { silent = true, noremap = true, desc = "Exit insert mode" })
vim.keymap.set("v", "D", '"_d', { silent = true, noremap = true, desc = "Delete without yank" })
vim.keymap.set("v", "u", "<ESC>u", { noremap = true, silent = true, desc = "Undo in visual mode" })
vim.keymap.set("v", "U", "<Nop>", { noremap = true, silent = true, desc = "Disable uppercase in visual mode" })
vim.keymap.set("n", "<C-d>", function()
  vim.wo.scrolloff = 999
  vim.defer_fn(function()
    vim.wo.scrolloff = 8
  end, 500)
  return "<c-d>"
end, { expr = true })

vim.keymap.set("n", "<C-u>", function()
  vim.wo.scrolloff = 999
  vim.defer_fn(function()
    vim.wo.scrolloff = 8
  end, 500)
  return "<c-u>"
end, { expr = true })
