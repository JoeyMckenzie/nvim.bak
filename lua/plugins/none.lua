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

        -- Pint
        null_ls.builtins.formatting.pint.with({
          command = "./vendor/bin/pint",
          args = { "$FILENAME" },
          condition = function(utils)
            return utils.root_has_file("pint.json") or utils.root_has_file("pint.json.dist")
          end,
        }),

        -- Prettier
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "html" },
          command = "./node_modules/.bin/prettier", -- or just "prettier" if global
          args = { "--stdin-filepath", "$FILENAME" },
          condition = function(utils)
            return utils.root_has_file(".prettierrc")
              or utils.root_has_file("prettier.config.js")
              or utils.root_has_file(".prettierrc.json")
          end,
        }),

        -- Stylelint
        null_ls.builtins.diagnostics.stylelint.with({
          command = "./node_modules/.bin/stylelint",
          args = { "--stdin", "--stdin-filename", "$FILENAME" },
          filetypes = { "scss", "css", "sass" },
          condition = function(utils)
            return utils.root_has_file(".stylelintrc")
              or utils.root_has_file("stylelint.config.js")
              or utils.root_has_file("stylelint.config.cjs")
              or utils.root_has_file(".stylelintrc.json")
          end,
        }),

        -- Optional formatting support (if using stylelint with autofix)
        null_ls.builtins.formatting.stylelint.with({
          command = "./node_modules/.bin/stylelint",
          args = {
            "--fix",
            "--stdin",
            "--stdin-filename",
            "$FILENAME",
          },
          filetypes = { "scss", "css", "sass" },
          condition = function(utils)
            return utils.root_has_file(".stylelintrc")
              or utils.root_has_file("stylelint.config.js")
              or utils.root_has_file(".stylelintrc.json")
          end,
        }),
      })
    end,
  },
}
