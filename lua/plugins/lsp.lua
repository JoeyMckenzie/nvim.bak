return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {
          enabled = false,
        },
        intelephense = {
          enabled = true,
        },
      },
    },
  },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
}
