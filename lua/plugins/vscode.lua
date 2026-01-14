if not vim.g.vscode then
  return {}
end

local enabled = {
  "LazyVim",
  "dial.nvim",
  "flit.nvim",
  "lazy.nvim",
  "leap.nvim",
  "mini.ai",
  "mini.comment",
  "mini.move",
  "mini.pairs",
  "mini.surround",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "snacks.nvim",
  "ts-comments.nvim",
  "vim-repeat",
  "yanky.nvim",
}

local Config = require("lazy.core.config")
local vscode = require("vscode")

Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end
vim.g.snacks_animate = false

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymapsDefaults",
  callback = function()
    local map = function(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.silent = true
      if type(rhs) == "string" then
        local command = rhs
        rhs = function()
          vscode.call(command)
        end
      end
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- EXPLORER (<leader>e)
    map("n", "<leader>e", "workbench.view.explorer")
    map("n", "<leader>E", "workbench.action.toggleSidebarVisibility")

    -- FIND/SEARCH
    map("n", "<leader><space>", "workbench.action.quickOpen")
    map("n", "<leader>ff", "workbench.action.quickOpen")
    map("n", "<leader>fb", "workbench.action.showAllEditors")
    map("n", "<leader>/", "workbench.action.findInFiles")
    map("n", "<leader>sg", "workbench.action.findInFiles")
    map("n", "<leader>sw", "workbench.action.findInFiles", {
      callback = function()
        vscode.call("workbench.action.findInFiles", { query = vim.fn.expand("<cword>") })
      end
    })

    -- LSP / CODE ACTIONS
    map({ "n", "v" }, "<leader>ca", "editor.action.quickFix")
    map("n", "<leader>cr", "editor.action.rename")
    map("n", "<leader>cf", "editor.action.formatDocument")
    map("n", "gd", "editor.action.revealDefinition")
    map("n", "gr", "editor.action.goToReferences")
    map("n", "gi", "editor.action.goToImplementation")
    map("n", "gy", "editor.action.goToTypeDefinition")
    map("n", "K", "editor.action.showHover")
    map("n", "[d", "editor.action.marker.prev")
    map("n", "]d", "editor.action.marker.next")
    map("n", "<leader>cd", "workbench.actions.view.problems")

    -- SYMBOLS
    map("n", "<leader>ss", "workbench.action.gotoSymbol")
    map("n", "<leader>sS", "workbench.action.showAllSymbols")

    -- BUFFERS / TABS (Standard LazyVim buffer navigation)
    map("n", "<S-h>", "workbench.action.previousEditor")
    map("n", "<S-l>", "workbench.action.nextEditor")
    map("n", "<leader>bb", "workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
    map("n", "<leader>bd", "workbench.action.closeActiveEditor")
    map("n", "<leader>bD", "workbench.action.closeOtherEditors")

    -- GIT
    map("n", "<leader>gg", "workbench.view.scm")
    map("n", "]]", "editor.action.dirtydiff.next")
    map("n", "[[", "editor.action.dirtydiff.prev")

    -- TERMINAL
    for _, lhs in ipairs({ "<leader>ft", "<leader>fT", "<c-/>", "<c-_>" }) do
      map("n", lhs, "workbench.action.terminal.toggleTerminal")
    end

    -- WINDOWS
    map("n", "<leader>ww", "workbench.action.focusNextGroup")
    map("n", "<leader>wd", "workbench.action.closeActiveEditor")
    map("n", "<leader>w-", "workbench.action.splitEditorDown")
    map("n", "<leader>w|", "workbench.action.splitEditorRight")
  end,
})

return {
  {
    "snacks.nvim",
    opts = {
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      picker = { enabled = false },
      quickfile = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
    },
  },
  {
    "LazyVim/LazyVim",
    config = function(_, opts)
      opts = opts or {}
      opts.colorscheme = function() end
      require("lazyvim").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}
