return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      -- import nvim-treesitter plugin
      local configs = require("nvim-treesitter.configs")

      -- configure treesitter
      configs.setup({
	-- enable syntax highlighting
        highlight = {
          enable = true,
          disable = { "latex" },
        },
        -- enable indentation
        indent = { enable = true },
        -- ensure these language parsers are installed
        ensure_installed = {
          "bash",
          "c",
          "comment",
          "diff",
          "json",
          "julia",
          "lua",
          "python",
          "rust",
          "xml",
          "yaml",
        },
      })
    end,
  },
}
