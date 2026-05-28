return {
  cmd = { vim.g.lsp_path .. "vscode-css-language-server", "--stdio"},
  filetypes = {"css", "scss", "less" },
  
  root_dir = require"lspconfig.util".root_pattern{
    "package.json",
    ".git"
  }, 
}
