return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")

      opts.sources = vim.list_extend(opts.sources or {}, {
        -- PHPStan
        null_ls.builtins.diagnostics.phpstan.with({
          command = "./vendor/bin/phpstan",
          args = {
            "--error-format=raw",
            "--no-progress",
            "analyse",
            "$FILENAME",
          },
          condition = function(utils)
            return utils.root_has_file("phpstan.neon") or utils.root_has_file("phpstan.neon.dist")
          end,
        }),

        -- Pint formatter
        null_ls.builtins.formatting.pint.with({
          command = "./vendor/bin/pint",
          args = { "$FILENAME" },
          condition = function(utils)
            return utils.root_has_file("pint.json") or utils.root_has_file("pint.json.dist")
          end,
        }),
      })
    end,
  },
}
