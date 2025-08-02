return {
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },

  -- Telescope & UI
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          find_command = {
            "fd",
            "--type",
            "f",
            "--hidden",
            "--no-ignore",
            "--exclude",
            ".git",
          },
        },
      },
    },
  },
  { "nvim-lua/plenary.nvim" },

  -- Testing
  { "nvim-neotest/nvim-nio" },
}
