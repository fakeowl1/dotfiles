return {
  cmd = {vim.g.lsp_path .. "pylsp"},
  filetypes = {"python"},
 
  on_attach = vim.g.lsp_on_attach,
  handlers = vim.g.lsp_handlers,
  capabilities = vim.g.lsp_capabilities,

  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391','W293',"E128","E124"},
          maxLineLength = 90
        }
      }
    }
  },
}
