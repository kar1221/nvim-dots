local find_pkg = require("util.find_pkg").find_pkg_dir

return {
  {
    "conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      local formatter
      if find_pkg(vim.fn.getcwd(), "@antfu/eslint-config") then
        formatter = {}
      else
        formatter = opts.formatters_by_ft.vue or {}
      end

      -- local joined = #formatter > 0 and table.concat(formatter, ", ") or "none"
      -- vim.notify("Current Formatter : " .. joined, vim.log.levels.INFO)

      opts.formatters_by_ft.vue = formatter
    end,
  },
}
