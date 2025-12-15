return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "pint", "php_cs_fixer" },
      },
      formatters = {
        php_cs_fixer = {
          command = "vendor/bin/php-cs-fixer",
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = { "phpstan" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "olimorris/neotest-phpunit",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-phpunit"),
        },
      })
    end,
  },
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "kevinhwang91/promise-async",
    },
    cmd = { "Laravel" },
    keys = {
      { "<leader>la", "<cmd>Laravel artisan<cr>", desc = "Laravel: Artisan" },
      { "<leader>lr", "<cmd>Laravel routes<cr>", desc = "Laravel: Routes" },
      { "<leader>lm", "<cmd>Laravel make<cr>", desc = "Laravel: Make" },
      { "<leader>lc", "<cmd>Laravel commands<cr>", desc = "Laravel: Commands" },
      { "<leader>lo", "<cmd>Laravel resources<cr>", desc = "Laravel: Resources" },
    },
    event = { "VeryLazy" },
    opts = {
      features = {
        pickers = {
          provider = "snacks", -- "snacks | telescope | fzf-lua | ui-select"
        },
      },
    },
  },
}
