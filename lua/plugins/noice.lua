if true then
  return {}
end

return {
  "folke/noice.nvim",
  opts = {
    routes = {
      -- for some reason after including nvchad ui this notification keeps
      -- popping up when i press comma key
      {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = {
          skip = true,
        },
      },

      {
        filter = {
          event = "notify",
          find = "No signature help available",
        },
        opts = {
          skip = true,
        },
      },
    },
  },
}
