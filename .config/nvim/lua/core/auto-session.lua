return {
  "rmagatti/auto-session",
  enabled = false,
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Downloads" },
    })

    vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
    vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
    vim.keymap.set("n", "<leader>sx", "<cmd>SessionDelete<CR>", { desc = "Delete session for auto session root dir" })
  end,
}
