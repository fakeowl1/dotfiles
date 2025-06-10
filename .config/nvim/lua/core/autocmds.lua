vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter","WinEnter","CmdwinEnter"},{
  callback = function()
    local ok, statusline_output = pcall(require, "core.statusline")
    if ok then 
      vim.opt.statusline = statusline_output
    else
      local ok, notify = pcall(require, "notify")
      if not ok then
        return 
      end

      print(statusline_output)
      notify("Error loading status line")
    end
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc) 
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end
    
    map('gl', vim.diagnostic.open_float, "[O]pen floating diagnostic message")  
    map('gd', vim.lsp.buf.declaration, "[G]oto [D]eclaration")
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
