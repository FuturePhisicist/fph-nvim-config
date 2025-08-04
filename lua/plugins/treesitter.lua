return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "c",
      "cpp",
      "bash",
      "python",
      "json",
      "lua",
      "dockerfile",
      -- "typst",   -- Tree-sitter grammar for Typst may require 3rd party repo
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

