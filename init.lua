-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  vim.o.cmdheight = 50
end
require("config.lazy")
