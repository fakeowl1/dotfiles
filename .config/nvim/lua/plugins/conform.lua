local ok, conform = pcall(require,"conform")
if not ok then
  vim.notify("Failed to load conform\n")
  return
end


conform.setup({
  formatters_by_ft = {
    python = {"black"},
    javascript = {"prettier"},
    golang = {"gofmt"}
  },
})

vim.keymap.set({"n", "v"}, "<leader>ff", 
  function()
    conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    }) 
  end, {desc = "Format file or range (in visual format)"})
