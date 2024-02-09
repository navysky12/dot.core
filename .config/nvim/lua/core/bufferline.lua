return {
  "akinsho/bufferline.nvim",
  event = "TabEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      tab_size = 25,
      always_show_bufferline = false,
      show_close_icon = false,
      offsets = { { filetype = "", text = "", padding = 1 } },
    },
  },
}
