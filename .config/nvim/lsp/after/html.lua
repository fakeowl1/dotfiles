return {
  cmd = {vim.g.lsp_path .. "vscode-html-language-server", "--stdio"},
  filetypes = {"html"},
  
  on_attach = vim.g.lsp_on_attach,
  handlers  = vim.g.lsp_handler,

  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
        css = true,
        javascript = true
    },
    provideFormatter = true
  },
}
