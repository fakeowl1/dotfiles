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

vim.g.lsp_on_attach = function(client, bufnr)
  print("Attaching to:",client.name)
  
  local nmap = function(keys, func, desc) 
    if desc then 
      desc = 'LSP: ' .. desc
    end
    
    vim.keymap.set("n", keys, func, {buffer = bufnr, desc = desc})
  end

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
   
  nmap('gd', vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("<leader>f", vim.lsp.buf.format(), "Format current buffer")
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences') 
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation') 
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  nmap('K',vim.lsp.buf.hover, "Hover Documentation")
  
  nmap('[d', vim.diagnostic.goto_prev, "[G]oto previous diagnostic message")
  nmap(']d', vim.diagnostic.goto_next, "[G]oto next diagnostic message")
  nmap('<leader>e', vim.diagnostic.open_float, "Open floating diagnostic message")  
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
    end
  end
end
