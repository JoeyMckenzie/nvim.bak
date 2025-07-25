return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- File explorer
  { "nvim-neo-tree/neo-tree.nvim" },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },

  -- Telescope & UI
  { "nvim-telescope/telescope.nvim" },
  { "nvim-lua/plenary.nvim" },

  -- Formatting / Linting
  { "stevearc/conform.nvim" },
  { "nvimtools/none-ls.nvim" },
}
