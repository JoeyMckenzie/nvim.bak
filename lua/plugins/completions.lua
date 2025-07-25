return {
  -- Completion Engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    enabled = true, -- ✅ force enable it
  },

  -- Sources
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  {
    "saadparwaiz1/cmp_luasnip",
    dependencies = { "hrsh7th/nvim-cmp" },
  },

  -- Snippet Engine
  { "L3MON4D3/LuaSnip" },

  -- (Optional) Friendly snippets collection
  { "rafamadriz/friendly-snippets" },
}
