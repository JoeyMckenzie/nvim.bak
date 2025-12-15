return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>fF",
      function()
        require("telescope.builtin").find_files({
          hidden = true,
          no_ignore = true,
          no_ignore_parent = true,
        })
      end,
      desc = "Find Files (incl hidden + gitignored)",
    },
  },
}
