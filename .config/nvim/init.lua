-- Keymaps

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>dt", ":windo diffthis<CR>", { desc = "Enable difference mode between panes" })
vim.keymap.set("n", "<leader>do", ":windo diffoff<CR>", { desc = "Disable difference mode between panes" })

vim.keymap.set("n", "<Up>", "g<Up>", { desc = "Cursor movement upwards respects wordwrap in Normal mode" })
vim.keymap.set("n", "<Down>", "g<Down>", { desc = "Cursor movement downwards respects wordwrap in Normal mode" })
vim.keymap.set("i", "<Up>", "<C-o>g<Up>", { desc = "Cursor movement upwards respects wordwrap in Insert mode" })
vim.keymap.set("i", "<Down>", "<C-o>g<Down>", { desc = "Cursor movement downwards respects wordwrap in Insert mode" })

vim.keymap.set("n", "<C-w>N", "<cmd>tabnew<CR>", { desc = "Open new tab" })


-- Options

vim.opt.termguicolors = false	        -- enable true colour

vim.opt.number = true		        -- shows absolute line number on cursor line
vim.opt.relativenumber = true           -- shows relative line numbers to cursor line
vim.opt.wrap = false		        -- disable line wrapping
vim.opt.breakindent = true              -- if line wrapping is on, ensure that indents are respected
vim.opt.showbreak = " "                 -- if line wrapping is on, the consequent lines in same block are clearer to see
vim.opt.linebreak = true                -- if line wrapping is on, doesn't cut through words
--vim.opt.cursorline = true	        -- highlight the current cursor line 
vim.opt.showtabline = 1		        -- only show tabline if multiple tabs open

vim.opt.ignorecase = true	        -- ignore case when searching
vim.opt.smartcase = true	        -- if you include mixed case in your search, assumes you want case-sensitive

vim.opt.shiftwidth = 2		        -- 2 spaces for indent width
vim.opt.expandtab = true	        -- expand tab to spaces
vim.opt.autoindent = true	        -- copy indent from current line when starting new one
vim.opt.signcolumn = "yes"              -- column for gitsigns

vim.opt.swapfile = false	        -- turn off swap file

vim.opt.conceallevel = 2                -- enable concealing
vim.g.vimsyn_embed = 'lP'

vim.opt.spell = true                    -- enable spellcheck
vim.opt.spelllang = "en_gb"             -- spellcheck language

vim.opt.clipboard:append("unnamedplus") -- clipboard support


-- Bootstrap lazy.nvim Plugin Manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Load Plugins

require("lazy").setup(
  {
    { import = "lsp" },
    { import = "core" },
    { import = "themes" },
  },
  {
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
  }
)
