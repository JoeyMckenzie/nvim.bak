return {
  "nvim-neotest/neotest",
  dependencies = {
    "olimorris/neotest-phpunit",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "V13Axel/neotest-pest",
  },
  opts = { adapters = { "neotest-pest" } },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-phpunit")({
          phpunit_cmd = function()
            return "./vendor/bin/phpunit"
          end,
        }),
      },
    })

    vim.keymap.set("n", "<leader>tt", function()
      require("neotest").run.run()
    end, { desc = "Run nearest test" })

    vim.keymap.set("n", "<leader>tf", function()
      require("neotest").run.run(vim.fn.expand("%"))
    end, { desc = "Run all tests in file" })

    vim.keymap.set("n", "<leader>to", function()
      require("neotest").output.open({ enter = true })
    end, { desc = "Open test output" })

    vim.keymap.set("n", "<leader>ts", function()
      require("neotest").summary.toggle()
    end, { desc = "Toggle test summary panel" })
  end,
}
