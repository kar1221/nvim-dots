return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      layout = {
        layout = {
          backdrop = true,
          row = 1,
          width = 0.5,
          min_width = 80,
          height = 0.8,
          border = "none",
          box = "vertical",
          { win = "preview", title = "{preview}", height = 0.4, border = true },
          {
            box = "vertical",
            border = true,
            title = "{title} {live} {flags}",
            title_pos = "center",
            { win = "input", height = 1, border = "bottom" },
            { win = "list", border = "none" },
          },
        },
      },
    },
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
