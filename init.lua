-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("code.keymap")
else
  require("config.lazy")
end
