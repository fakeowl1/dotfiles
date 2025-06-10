vim.lsp.enable({
  "pylsp",
  "ts_ls",
  "cssls",
  "html",
  "texlab",
  "clangd",
})

-- Settings diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = vim.g.diagnostic_sings.error,
      [vim.diagnostic.severity.WARN]  = vim.g.diagnostic_sings.warn,
      [vim.diagnostic.severity.INFO]  = vim.g.diagnostic_sings.info,
      [vim.diagnostic.severity.HINT]  = vim.g.diagnostic_sings.hint, 
    },
  },

  underline = true,
  update_in_insert = false,
  severity_sort = false,
  
  virtual_lines = true,
  virtual_text = {prefix = 'x'},
  float = {border = "rounded"},
})

vim.g.lsp_handler = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border="rounded"}),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,{border="rounded"})
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

vim.g.lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
