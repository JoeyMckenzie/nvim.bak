return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")

      -- PHP
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

        -- Prettier
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "html", "scss" },
          command = "./node_modules/.bin/prettier", -- fallback to just "prettier" if installed globally
          args = { "--stdin-filepath", "$FILENAME" },
          condition = function(utils)
            return utils.root_has_file(".prettierrc") or utils.root_has_file("prettier.config.js")
          end,
        }),
      })
    end,
  },
  {
    -- Add neotest-pest plugin for running PHP tests.
    -- A package is also available for PHPUnit if needed.
    "nvim-neotest/neotest",
    dependencies = { "V13Axel/neotest-pest" },
    opts = { adapters = { "neotest-pest" } },
  },
}
