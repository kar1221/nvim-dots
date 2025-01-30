local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

---@param action string
local function vscode(action)
  return function()
    require("vscode").action(action)
  end
end

local nv = { "n", "v" }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap({ "n", "v" }, "y", '"+y', opts)

-- Vscode Specific

keymap(nv, "K", vscode("editor.action.showHover"))
keymap(nv, "<leader>cf", vscode("editor.action.formatDocument"))
keymap(nv, "gd", vscode("editor.action.revealDefinition"))
keymap(nv, "gD", vscode("editor.action.revealDeclaration"))
keymap(nv, "gR", vscode("editor.action.goToReferences"))
keymap(nv, "<leader>ff", vscode("workbench.action.quickOpen"))
keymap(nv, "<leader>cp", vscode("workbench.actions.view.problems"))
keymap(nv, "<leader>la", vscode("editor.action.quickFix"))
keymap(nv, "<leader>|", vscode("workbench.action.splitEditor"))
keymap(nv, "<leader>q", vscode("workbench.action.closeActiveEditor"))
keymap(nv, "<leader>e", vscode("workbench.action.toggleSidebarVisibility"))
keymap(nv, "<leader>z", vscode("workbench.action.toggleZenMode"))
