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

        -- Biome (preferred)
        null_ls.builtins.formatting.biome.with({
          filetypes = { "javascript", "typescript", "json", "jsonc", "html", "scss" },
          command = "./node_modules/.bin/biome",
          args = { "format", "--stdin-filepath", "$FILENAME" },
          condition = function(utils)
            return utils.root_has_file("biome.json")
          end,
        }),
        null_ls.builtins.diagnostics.biome.with({
          filetypes = { "javascript", "typescript", "json", "jsonc" },
          condition = function(utils)
            return utils.root_has_file(".biome.json") or utils.root_has_file("biome.json")
          end,
        }),

        -- Prettier fallback (if no Biome config is found)
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "html", "scss", "javascript", "typescript", "json", "jsonc" },
          command = "./node_modules/.bin/prettier",
          args = { "--stdin-filepath", "$FILENAME" },
          condition = function(utils)
            return not (utils.root_has_file(".biome.json") or utils.root_has_file("biome.json"))
              and (
                utils.root_has_file(".prettierrc")
                or utils.root_has_file("prettier.config.js")
                or utils.root_has_file(".prettierrc.json")
              )
          end,
        }),

        -- ESLint fallback (only if no Biome)
        null_ls.builtins.diagnostics.eslint.with({
          command = "./node_modules/.bin/eslint",
          condition = function(utils)
            return not (utils.root_has_file(".biome.json") or utils.root_has_file("biome.json"))
                and utils.root_has_file(".eslintrc")
              or utils.root_has_file(".eslintrc.js")
          end,
        }),

        -- Styleline
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
