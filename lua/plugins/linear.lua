return {
  {
    "joeymckenzie/linear.nvim",
    dir = "/Users/joeymckenzie/code/github.com/joeymckenzie/linear.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      ui = {
        statusline = {
          show_title = true,
        },
      },
    },
  },
  -- Add Linear statusline to lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 1, require("linear").statusline)
    end,
  },
}
