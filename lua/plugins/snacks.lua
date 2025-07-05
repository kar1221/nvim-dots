return {
  "folke/snacks.nvim",
  opts = {
    -- Indent
    indent = {
      indent = {
        only_scope = true,
      },
      chunk = {
        enabled = true,
        char = {
          arrow = "─",
          corner_top = "╭",
          corner_bottom = "╰",
        },
      },
    },
  },
}
