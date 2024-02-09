vim.api.nvim_create_autocmd(
  "BufWinEnter", {
    pattern = "<buffer>",
    callback = function()
      vim.opt_local.wrap = true
    end
  }
)
