local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File tree
map("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Bufferline navigation
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Comment toggling (use Comment.nvim API instead of mapping to strings if needed)
map("n", "<leader>c", function()
  require("Comment.api").toggle.linewise.current()
end, opts)

map("v", "<leader>c", function()
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, opts)

-- LSP keymaps
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)

-- MRU buffer cycling
map("n", "<C-Tab>", function() require("config.switches").cycle_mru(1) end)
map("n", "<C-S-Tab>", function() require("config.switches").cycle_mru(-1) end)

-- Gitsigns keymaps (now safe to call)
local ok, gitsigns = pcall(require, "gitsigns")
if ok then
  map("n", "]g", gitsigns.next_hunk, { desc = "Next Git hunk" })
  map("n", "[g", gitsigns.prev_hunk, { desc = "Previous Git hunk" })
  map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview Git hunk" })
  map("n", "<leader>gb", gitsigns.blame_line, { desc = "Blame current line" })
  map("n", "<leader>gt", gitsigns.toggle_current_line_blame, { desc = "Toggle blame" })
  map("n", "<leader>gd", gitsigns.diffthis, { desc = "View diff" })
end

