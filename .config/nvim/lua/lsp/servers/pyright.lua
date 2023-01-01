return {
    cmd = {vim.g.lsp_path .. "pyright-langserver", "--stdio"},
    filetypes = {"python"},
   
    on_attach = vim.g.lsp_on_attach,
    handlers = vim.g.lsp_handlers,
    capabilities = vim.g.lsp_capabilities,
}
