local lsp = require_mod("lspconfig")
local mason_lsp = require_mod("mason-lspconfig")

local sign = vim.fn.sign_define
local sign_name = {"Error","Warn","Info","Hint"} 

-- Set lsp signs
for k, icon in pairs(vim.g.diagnostic_sings) do 
  sign("DiagnosticSign" .. sign_name[k],{text=icon,texthl="DiagnosticSign" .. sign_name[k]})
end

-- Settings diagnostics
vim.diagnostic.config {
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,

  virtual_text = {prefix = 'x'},
  float = {border = "rounded"},
}

vim.g.lsp_handler = {
  ["textDocument/hover"]  = vim.lsp.with(vim.lsp.handlers.hover,{border="rounded"}),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,{border="rounded"})
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}


local navic = require("nvim-navic")

vim.g.lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


vim.g.lsp_on_attach = function(client,bufnr)
  print("Attaching to:",client.name)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr,...) end
  local opts = {noremap = true,silent=true}
	  
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  buf_set_keymap('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>',opts)
  buf_set_keymap('n','K', '<cmd>lua vim.lsp.buf.hover()<CR>',opts)
  buf_set_keymap('n','[d','<cmd>lua vim.diagnostic.goto_prev()<CR>',opts)
  buf_set_keymap('n',']d','<cmd>lua vim.diagnostic.goto_next()<CR>',opts)
  buf_set_keymap('n','<leader>d','<cmd>lua vim.diagnostic.open_float({border="rounded"})<CR>',opts)
  -- buf_set_keymap('n','<space>f','<cmd>lua vim.lsp.buf.formatting()<CR>',opts)
end

local servers = mason_lsp.get_installed_servers()

for _, server in ipairs(servers) do
  local ok, result = pcall(require, "lsp.servers."..server)
  if ok then
    local lsp_server = lsp[server]
    if lsp_server ~= nil then
      local ok, err = pcall(lsp_server.setup, result)
      if err ~= nil then
        vim.pretty_print(err)
      end
    else
      vim.pretty_print({server = server, result = result})
      -- vim.notify("Missing server configuration for " .. server, "error")
    end
  end
end
