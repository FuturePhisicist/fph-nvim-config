return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add          = { text = "┃" },
      change       = { text = "┃" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" },
    },
    signs_staged = {
      add          = { text = "┃" },
      change       = { text = "┃" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" },
    },
    signs_staged_enable = true,
    signcolumn = true,       -- Show signs in sign column
    numhl      = false,      -- Highlight line numbers
    linehl     = false,      -- Highlight full line
    word_diff  = false,      -- Word-level diff
    watch_gitdir = {
      follow_files = true,
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- You can toggle with :Gitsigns toggle_current_line_blame
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  },
  config = function(_, opts)
    local gitsigns = require("gitsigns")
    gitsigns.setup(opts)

    -- Keymaps (safe to define after plugin loads)
	-- ToDo: move to a unified location
    local map = vim.keymap.set
    local key_opts = { noremap = true, silent = true }

    map("n", "]g", gitsigns.next_hunk, { desc = "Next Git hunk" })
    map("n", "[g", gitsigns.prev_hunk, { desc = "Previous Git hunk" })
    map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview Git hunk" })
    map("n", "<leader>gb", gitsigns.blame_line, { desc = "Blame current line" })
    map("n", "<leader>gt", gitsigns.toggle_current_line_blame, { desc = "Toggle blame" })
    map("n", "<leader>gd", gitsigns.diffthis, { desc = "View diff" })
  end,
}
