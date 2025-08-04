local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File tree
map("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Bufferline navigation
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Comment toggling
map("n", "<leader>c", "gcc", opts)
map("v", "<leader>c", "gc", opts)

-- LSP keymaps
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)

-- MRU buffer cycling
map("n", "<C-Tab>", function() require("config.switches").cycle_mru(1) end)
map("n", "<C-S-Tab>", function() require("config.switches").cycle_mru(-1) end)

