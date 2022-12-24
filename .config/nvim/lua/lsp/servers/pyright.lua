return {
    filetypes = {"python"},
    
    cmd = {vim.g.lsp_path .. "pyright-langserver", "--stdio"},
    
    on_attach = vim.g.lsp_on_attach,
    handlers = vim.g.lsp_handlers,
    
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.g.lsp_capabilities), 
}
