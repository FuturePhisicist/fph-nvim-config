vim.opt.number = true
-- vim.opt.relativenumber = true

vim.opt.shiftwidth = 4				-- Number of spaces inserted for each indentation
vim.opt.expandtab = false			-- Convert tabs to spaces
vim.opt.tabstop = 4				-- A tab character is 2 spaces wide (visual alignment)
-- vim.opt.softtabstop = 0			-- Number of spaces a tab feels like when editing (0 = use shiftwidth)
vim.opt.smartindent = false			-- Don't auto-indent smartly (manual indentation)

vim.opt.cursorline = true			-- Highlight the line under your cursor
vim.opt.cursorlineopt = "number"		-- Only highlight the line number, not the whole line
vim.cmd([[hi CursorLineNr guifg=#af00af]])	-- Make the line number color purple-ish (#af00af)


vim.opt.termguicolors = true			-- Use full RGB colors so my Neovim can look gorgeous, please and thank you.
vim.opt.clipboard = "unnamedplus"		-- ✅ Clipboard from system
vim.opt.hidden = true				-- It allows you to switch between buffers (open files) without saving changes first.

vim.g.mapleader = " "

