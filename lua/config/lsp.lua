local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)

-- Lua LSP
vim.lsp.config("lua_ls", {
  capabilities = capabilities,    -- add this to every server
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".git" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Go LSP
vim.lsp.config("gopls", {
  capabilities = capabilities,    -- add this to every server
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork" },
  root_markers = { "go.mod", "go.sum", ".git" },
})

-- Python LSP
vim.lsp.config("pyright", {
  capabilities = capabilities,    -- add this to every server
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
})

-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",   -- .jsx files
    "typescript",
    "typescriptreact",   -- .tsx files
  },
  root_markers = { "package.json", "tsconfig.json", ".git" },
})

-- JSON
vim.lsp.config("jsonls", {
  capabilities = capabilities,
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
})

-- Enable all servers
vim.lsp.enable({ "lua_ls", "gopls", "pyright", "ts_ls", "jsonls" })

-- Keybinds
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf

    local client = vim.lsp.get_client_by_id(args.client_id)
    -- disable LSP formatting, let conform handle it
    if client then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end


    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = buf, desc = desc })
    end

    map("gd", vim.lsp.buf.definition, "Go to Definition")
    map("gr", vim.lsp.buf.references, "Find References")
    map("K",  vim.lsp.buf.hover, "Hover Docs")
    map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
    map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
  end,
})

-- Configration in this Repo
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lsp-configs
