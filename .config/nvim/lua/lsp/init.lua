local ok, lsp = pcall(require,"lspconfig")
if not ok then
    vim.notify("Failed to load lspconfig\n\n")
    return
end

local ok, mason_lsp = pcall(require, "mason-lspconfig")
if not ok then
    vim.notify("Failed load mason-lspconfig")
end

local sign = vim.fn.sign_define
local sign_name = {"Error","Warn","Info","Hint"} 


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

vim.g.lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


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

for k, icon in pairs(vim.g.diagnostic_sings) do 
    sign("DiagnosticSign" .. sign_name[k],{text=icon,texthl="DiagnosticSign" .. sign_name[k]})
end


vim.g.lsp_on_attach = function(client,bufnr)
    print("Attaching to:",client.name)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr,...) end
    local opts = {noremap = true,silent=true}

    buf_set_keymap('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>',opts)
    buf_set_keymap('n','K', '<cmd>lua vim.lsp.buf.hover()<CR>',opts)
    buf_set_keymap('n','[d','<cmd>lua vim.diagnostic.goto_prev()<CR>',opts)
    buf_set_keymap('n',']d','<cmd>lua vim.diagnostic.goto_next()<CR>',opts)
    buf_set_keymap('n','<leader>d','<cmd>lua vim.diagnostic.open_float({border="rounded"})<CR>',opts)
    buf_set_keymap('n','<space>f','<cmd>lua vim.lsp.buf.formatting()<CR>',opts)
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
            vim.notify("Missing server configuration for " .. server,"error")
            vim.pretty_print({server = server, result = result})
        end
    end
end
