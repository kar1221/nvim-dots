-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local find_pkg = require("util").find_pkg_dir
local LazyVim = require("lazyvim.util")

vim.keymap.set("n", "<leader>cf", function()
  if find_pkg(vim.fn.getcwd(), "@antfu/eslint-config") then
    vim.fn.system({ "eslint", "--fix" })
    vim.notify("Formatting using eslint", vim.log.levels.INFO)
  else
    vim.notify("Formatting using default formatter", vim.log.levels.INFO)
    LazyVim.format({ force = true })
  end
end, { desc = "Format" })
