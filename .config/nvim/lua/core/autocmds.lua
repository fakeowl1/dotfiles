vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter","WinEnter","CmdwinEnter"},{
  callback = function()
    if vim.fn.expand("%") == "NvimTree_1" then
      vim.opt.statusline = " NvimTree"
      return ""
    end

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

-- vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter","WinEnter","CmdwinEnter"},{
--   callback = function()
--
--   end,
-- })
