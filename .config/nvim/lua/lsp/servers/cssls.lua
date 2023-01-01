return {
    cmd = { vim.g.lsp_path .. "vscode-css-language-server", "--stdio"},
    filetypes = {"css", "scss", "less" },
    
    on_attach = vim.g.lsp_on_attach,
    handlers  = vim.g.lsp_handler,
    capabilities = vim.g.lsp_capabilities,
    
    root_dir = require"lspconfig.util".root_pattern{
        "package.json",
        ".git"
    }, 
}
