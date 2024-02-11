vim.api.nvim_create_autocmd(
  "BufWinEnter", {
    callback = function()
      vim.opt_local.wrap = true
      --vim.cmd("VimtexTocOpen")
    end
  }
)

vim.api.nvim_create_autocmd(
  "VimLeave", {
    callback = function()
      vim.cmd("VimtexClean")
    end
  }
)

