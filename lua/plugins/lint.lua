return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = {},
      },
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
}
