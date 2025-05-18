return {
  cmd = {vim.g.lsp_path ..  "typescript-language-server", "--stdio"},
  filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
  
  on_attach = vim.g.lsp_on_attach,
  handlers = vim.g.lsp_handlers,
  capabilities = vim.g.lsp_capabilities,

  init_options = {
    hostInfo = "neovim",
    preferences = {
      disableSuggestions = true,
    },
  },
  root_dir = require"lspconfig.util".root_pattern{
    "package.json", 
    "tsconfig.json", 
    "jsconfig.json", 
    ".git",
  },
}
