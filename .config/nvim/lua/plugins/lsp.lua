local ok,nvim_lsp = pcall(require,"lspconfig")
if not ok then
    vim.notify("Failed to load lspconfig\n\n")
    return
end

local utils = require"core.utils"
local root_pattern = require"lspconfig.util".root_pattern
local sign = vim.fn.sign_define
local capabilities = vim.lsp.protocol.make_client_capabilities()

local handlers =  {
    ["textDocument/hover"]         =  vim.lsp.with(vim.lsp.handlers.hover,{border = "rounded"}),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help,{border = "rounded"}),
}


local function DiagnosticSign(name,icon,color)
    sign("DiagnosticSign"..name,{text=icon,texthl="DiagnosticSign"..name})
    if (color ~= "Default") then
        utils.highlight{"Diagnostic"..name,fg=color}
    end
end


for _,sign in pairs(vim.g.diagnostics_signs) do
    DiagnosticSign(sign.name,sign.icon,sign.color)
end

vim.diagnostic.config {
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,

    virtual_text = {prefix = 'x'},
    float = {border = "rounded"},
}


local on_attach = function(client,bufnr)
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

-- LSP Servers
nvim_lsp.clangd.setup {
    filetypes = {"c","cpp","objc","objcpp"},
    on_attach = on_attach,
    handlers = handlers,
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities),
    root_dir = root_pattern {
        "CMakeList.txt",
        "compile_flags.txt",
        ".git",
        vim.fn.getcwd()
    }
}

nvim_lsp.pyright.setup{
    on_attach = on_attach,
    handlers = handlers,
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities), 
}

nvim_lsp.gopls.setup {
    cmd = {"gopls","server"},
    filetypes = {"go", "gomod"},
    on_attach = on_attach,
    handlers = handlers,
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities),
    root_dir = root_pattern{
        "go.mod",
        ".git",
        vim.fn.getcwd(),
    },
}
