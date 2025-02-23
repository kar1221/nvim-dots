return {
  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    keys = {
      { "<leader>cp", "<cmd>CompilerOpen<CR>", desc = "Open compiler menu" },
      { "<leader>cP", "<cmd>CompilerToggleResults<CR>", desc = "Toggle Compiler Result" },
      { "<leader>cR", "<cmd>CompilerRedo<CR>", desc = "Recompile" },
    },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
}
