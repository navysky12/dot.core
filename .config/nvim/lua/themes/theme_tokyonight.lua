return {
  "folke/tokyonight.nvim",
  lazy = false,
  enabled = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme tokyonight-night]])
  end,
}
