return {
  -- Mason: installs language servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Bridges mason with built-in LSP
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",   -- Lua
          "gopls",    -- Go
	  "pyright",   -- Python
	  "ts_ls",
	  "jsonls"
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "zapling/mason-conform.nvim",   -- bridges mason + conform
    config = function()
      require("mason-conform").setup({
        ensure_installed = { "prettier" },
      })
    end,
  },
}
