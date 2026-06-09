return {
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          javascript      = { "prettier" },
          javascriptreact = { "prettier" },
          typescript      = { "prettier" },
          typescriptreact = { "prettier" },
          json            = { "prettier" },
          css             = { "prettier" },
          html            = { "prettier" },
          python          = { "ruff_format" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = false,
        },
      })
      -- manual format keymap
      vim.keymap.set("n", "<leader>f", function()
        conform.format({ async = true, lsp_fallback = false })
      end, { desc = "Format file" })
    end,
  },
}
