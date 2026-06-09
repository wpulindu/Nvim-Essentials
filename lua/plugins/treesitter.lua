return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    auto_install = false,
    ensure_installed = {
      "lua",
      "python",
      "vim",
      "vimdoc",
      "python",    -- add/remove based on your languages
      "javascript",
      "ts_ls",
      "jsonls"
    },
    highlight = { enable = true },
  },
}
