local ok, conform = pcall(require,"conform")
if not ok then
  vim.notify("Failed to load conform\n")
  return
end

conform.setup({
  formatters_by_ft = {
    python = {"black"},
    javascript = {"prettier"},
  },
})
