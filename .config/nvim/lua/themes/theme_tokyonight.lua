return {
  "folke/tokyonight.nvim",
  lazy = false,
  enabled = true,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      transparent = true,
    })
    vim.cmd([[colorscheme tokyonight-night]])
  end,
}

