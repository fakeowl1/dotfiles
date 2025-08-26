return {
  cmd = { "pylsp" },
  filetypes = {"python"},
 
  on_attach = vim.g.lsp_on_attach,
  handlers = vim.g.lsp_handlers,
  capabilities = vim.g.lsp_capabilities,
  
  root_dir = function(fname)
      local util = require 'lspconfig.util'

      local root_files = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
      }
      
      return util.root_pattern(unpack(root_files))(fname)
        or vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
  end,
  single_file_support = true,
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
