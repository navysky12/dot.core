return {
  "lervag/vimtex",
  config = function()
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_syntax_enabled = 1
    vim.g.vimtex_toc_config = {
      indent_levels = 1,
      layer_status = {
        content = 1,
        label = 0,
        todo = 1,
        include = 0,
      },
      show_help = 0,
      split_pos = 'vert rightbelow',
      split_width = 50,
    }
    vim.g.tex_conceal = 'abdmgs'
  end,
}
