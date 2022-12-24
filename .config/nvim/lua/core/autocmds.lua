vim.api.nvim_create_autocmd({"WinEnter","BufEnter"},{
    callback = function()
        vim.opt.statusline = "%F"
    end
})

vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter","WinEnter","CmdwinEnter"},{
    callback = function()
        if vim.fn.expand("%") == "NvimTree_1" then
            vim.opt.statusline = " NvimTree"
        end
    end,
})
