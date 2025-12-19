return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.highlight) == "table" then
        opts.highlight.disable = opts.highlight.disable or {}
        if type(opts.highlight.disable) == "table" then
          -- Don't disable PHP highlighting, we want to enhance it
        end
      end
    end,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "php",
        callback = function()
          -- Set up custom highlight groups for docblocks
          vim.api.nvim_set_hl(0, "PHPDocVar", { link = "Type", bold = true })
          vim.api.nvim_set_hl(0, "PHPDocVarType", { fg = "#56B6C2", bold = false })
          vim.api.nvim_set_hl(0, "PHPDocParam", { link = "Type" })
          vim.api.nvim_set_hl(0, "PHPDocReturn", { link = "Type" })
          vim.api.nvim_set_hl(0, "PHPDocProperty", { link = "Type", bold = true })
          vim.api.nvim_set_hl(0, "PHPDocPropertyType", { fg = "#56B6C2", bold = false })
          vim.api.nvim_set_hl(0, "PHPDocMethod", { link = "Type", bold = true })
          vim.api.nvim_set_hl(0, "PHPDocMethodSignature", { fg = "#56B6C2", bold = false })
          vim.api.nvim_set_hl(0, "PHPStanType", { link = "Special", bold = true })

          -- Use matchadd to highlight patterns in comments
          vim.fn.matchadd("PHPDocVar", "@var")
          vim.fn.matchadd("PHPDocVarType", "@var\\s\\+\\zs\\?[A-Za-z0-9_\\\\|<>\\[\\], ]\\+")
          vim.fn.matchadd("PHPDocParam", "@param\\s\\+\\zs\\?[A-Za-z0-9_\\\\|<>\\[\\], ]\\+")
          vim.fn.matchadd("PHPDocReturn", "@return\\s\\+\\zs\\?[A-Za-z0-9_\\\\|<>\\[\\], ]\\+")
          vim.fn.matchadd("PHPDocProperty", "@property")
          vim.fn.matchadd("PHPDocPropertyType", "@property\\s\\+\\zs\\?[A-Za-z0-9_\\\\|<>\\[\\], ]\\+")
          vim.fn.matchadd("PHPDocMethod", "@method")
          vim.fn.matchadd("PHPDocMethodSignature", "@method\\s\\+\\zs\\?[A-Za-z0-9_\\\\(\\)$|<>\\[\\], ]\\+")
          vim.fn.matchadd("PHPStanType", "@phpstan-type\\s\\+\\w\\+")
        end,
      })
    end,
  },
}
