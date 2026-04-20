
vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 100,
          ignore = {'W391','W293',"E128","E124"}
        }
      }
    }
  }
})

vim.lsp.enable({
  "pylsp",
  "ts_ls",
  "gopls",
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


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

vim.g.lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc) 
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- local rounded_wrapper = function(opener)
    --     return function(contents, syntax, opts)
    --         opts = vim.tbl_deep_extend("force", opts, { border = "rounded" })
    --         return opener(contents, syntax, opts)
    --     end
    -- end
    
    map('gl', function() vim.diagnostic.open_float({ border = 'rounded' }) end, "[O]pen floating diagnostic message")
    map('gd', vim.lsp.buf.definition, "[G]oto [D]eclaration")
    map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    map('K',vim.lsp.buf.hover, "[H]over Documentation")
    map('<leader>lr', vim.lsp.buf.rename, "Rename all references")
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences') 
    map("<leader>fb", function() require("conform").format({ bufnr = event.buf, async = true }) end, "[F]ormat current buffer")

    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    -- nmap('<leader>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, '[W]orkspace [L]ist Folders')
  end,
})
