return {
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- Show filtered items (e.g. dotfiles)
          show_hidden_count = true,
          hide_dotfiles = false, -- Don't hide dotfiles
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
  { "nvim-telescope/telescope.nvim" },
  { "nvim-lua/plenary.nvim" },

  -- Testing
  { "nvim-neotest/nvim-nio" },
}
