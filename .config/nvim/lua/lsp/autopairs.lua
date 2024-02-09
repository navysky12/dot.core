return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- import nvim-autopairs
    local autopairs = require("nvim-autopairs")

    -- configure autopairs
    autopairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
      },
      ignored_next_char = "[%w%.]",
    })

    -- import nvim-autopairs completion functionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- import nvim-cmp plugin (completions plugin)
    local cmp = require("cmp")

    -- make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- custom rules
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")

    -- Custom autopairs configuration for LaTeX files
    autopairs.add_rule(Rule("$$", "$$", "tex"))
    autopairs.add_rule(
      Rule("$", "$", { "tex", "latex" })
        :with_pair(cond.not_after_regex("%%"))
        :with_pair(cond.not_before_regex("xxx", 3))
        :with_move(cond.none())
        :with_del(cond.not_after_regex("xx"))
        :with_cr(cond.none())
    )
  end,
}

