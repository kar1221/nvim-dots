-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local find_pkg = require("util").find_pkg_dir
local LazyVim = require("lazyvim.util")

vim.keymap.set("n", "<leader>cf", function()
  if find_pkg(vim.fn.getcwd(), "@antfu/eslint-config") then
    vim.fn.system({ "eslint", "--fix" })
    -- vim.notify("Formatting using eslint", vim.log.levels.INFO)
  else
    -- vim.notify("Formatting using default formatter", vim.log.levels.INFO)
    LazyVim.format({ force = true })
  end
end, { desc = "Format" })

local should_profile = os.getenv("NVIM_PROFILE")
if should_profile then
  require("profile").instrument_autocmds()
  if should_profile:lower():match("^start") then
    require("profile").start("*")
  else
    require("profile").instrument("*")
  end
end

local function toggle_profile()
  local prof = require("profile")
  if prof.is_recording() then
    prof.stop()
    vim.ui.input({ prompt = "Save profile to:", completion = "file", default = "profile.json" }, function(filename)
      if filename then
        prof.export(filename)
        vim.notify(string.format("Wrote %s", filename))
      end
    end)
  else
    prof.start("*")
  end
end
vim.keymap.set("", "<f1>", toggle_profile)
