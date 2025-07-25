return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              licenceKey = vim.fn.trim(vim.fn.readfile(vim.fn.expand("~/.config/intelephense/license.txt"))[1] or ""),
              environment = {
                includePaths = {
                  "vendor",
                  "src",
                  "app",
                },
              },
              files = {
                maxSize = 1000000,
              },
            },
          },
        },
      },
    },
  },
}
