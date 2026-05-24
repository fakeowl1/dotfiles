-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dn', function() 
  vim.diagnostic.jump({count = 1, float = true})
end, { desc = 'Diagnostic: Go to next' })

vim.keymap.set('n', '<leader>dp', function() 
  vim.diagnostic.jump({count = -1, float = true}) 
end, { desc = 'Diagnostic: Go to previous' })

vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Diagnostic: Show line' })
vim.keymap.set('n', '<leader>ds', vim.diagnostic.setloclist, { desc = 'Diagnostic: Location list' })

local capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
  }
}

capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("*", {
    capabilities = capabilities
  }
)

vim.diagnostic.config{
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
}

vim.lsp.enable({
  "clangd", 
  "gopls", 
  "cssls", 
  "html", 
  "pylsp", 
  "texlab",
  "ts_ls",
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc) 
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map('<leader>rn', vim.lsp.buf.rename, "Rename all references")
    map('gd', vim.lsp.buf.definition, "[G]oto [D]eclaration")
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('K',vim.lsp.buf.hover, "[H]over Documentation")

    map("<leader>fb", function() require("conform").format({ bufnr = event.buf, async = true }) end, "[F]ormat current buffer")
    
    -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    -- nmap('<leader>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, '[W]orkspace [L]ist Folders')
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then

        vim.api.nvim_create_autocmd('BufWritePre', {
          group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
          buffer = ev.buf,
          callback = function()
            vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
          end,
        })
    end
  end,
})
