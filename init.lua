print("loading plugins")
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

vim.opt.relativenumber = true
vim.opt.wrap = false 
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set({"n", "x"}, "<leader>c", '"+y')
vim.keymap.set({"n", "x"}, "<leader>p", '"+p')
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")

local plugins = {
	{"catppuccin/nvim"},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" }}
} 

local options = {}

require("lazy").setup(plugins, opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin-mocha")
