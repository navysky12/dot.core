vim.api.nvim_create_autocmd(
  "BufWinEnter", {
    pattern = "<buffer>",
    callback = function()
      vim.cmd("wincmd H")
    end
  }
)

