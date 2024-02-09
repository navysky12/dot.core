return {
  "dylanaraps/wal.vim",
  lazy = false,
  enabled = true,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme wal]])
  end,
}
