return {
    filetypes = {"c","cpp","objc","objcpp"},
    
    on_attach = vim.g.lsp_on_attach,
    handlers = vim.g.lsp_handlers,
    
    capabilities = vim.g.lsp_capabilities,
    root_dir = require"lspconfig.util".root_pattern{
        "CMakeList.txt",
        "compile_flags.txt",
        ".git",
        vim.fn.getcwd()
    }
}
