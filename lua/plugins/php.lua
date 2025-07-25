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
}
