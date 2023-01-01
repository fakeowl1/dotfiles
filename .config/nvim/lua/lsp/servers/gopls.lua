return {
    cmd = {vim.g.lsp_path .. "gopls"},
    filetypes = {"go", "gomod"},
    
    on_attach = vim.g.lsp_on_attach,
    handlers  = vim.g.lsp_handler,
    capabilities = vim.g.lsp_capabilities,
    
    root_dir = require"lspconfig.util".root_pattern{
        "go.mod",
        ".git",
        vim.fn.getcwd(),
    },
}
