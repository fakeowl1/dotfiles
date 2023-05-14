local ok,cmp = pcall(require,"cmp")
if not ok then
  vim.notify("Failed to load cmp\n\n")
  return
end

cmp.setup({
  mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_next_item(),
		["<C-j>"] = cmp.mapping.select_prev_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({select = false}),
  }),
  
  completion = {
    -- autocomplete = true,
    completeopt = "menu,menuone,noinsert",
    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  window = {
    completion    = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({mode = "symbol_text", maxwidth = 50})(entry, vim_item) 
      local strings = vim.split(kind.kind, "%s",{trimempty = true})
      kind.kind = " " .. strings[1] .. " "
      kind.menu = "    (" .. strings[2] .. ")"

      return kind
    end

  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "emoji" },
    { name = "calc" },
  },

})
