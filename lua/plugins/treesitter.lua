-- Complete f*** BS: https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },

  init = function()
    local parsers = {
      "c",
      "cpp",
      "bash",
      "python",
      "json",
      "lua",
      "dockerfile",
      "rust",
      "sql",
      "markdown",
      "markdown_inline",
      -- "typst",   -- Tree-sitter grammar for Typst may require 3rd party repo
    }

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyDone",
      callback = function()
        local installed = require("nvim-treesitter.config").get_installed()

        local missing = vim.tbl_filter(function(parser)
          return not vim.tbl_contains(installed, parser)
        end, parsers)

        if #missing > 0 then
          require("nvim-treesitter").install(missing)
        end
      end,
    })
  end,

  config = function()
    require("nvim-treesitter").setup()
  end,
}

