vim.api.nvim_create_autocmd(
  "BufWinEnter", {
    callback = function()
      vim.opt_local.wrap = true
    end
  }
)

