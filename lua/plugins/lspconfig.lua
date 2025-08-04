return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    return {
      diagnostics = {
        underline = false,
        update_in_insert = false,
        virtual_text = false,
        signs = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = false,
        },
      },

      inlay_hints = {
        enabled = false,
      },

      codelens = {
        enabled = false,
      },

      -- LSP capabilities (completion, etc.)
      capabilities = vim.lsp.protocol.make_client_capabilities(),

      -- Optional formatting behavior
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },

      servers = {
        pyright = {},
        clangd = {},
        bashls = {},
        dockerls = {},
        jsonls = {},
      },

      -- Optional custom setups
      setup = {},
    }
  end,

  config = function(_, opts)
    vim.diagnostic.config(opts.diagnostics)

    local lspconfig = require("lspconfig")
    local capabilities = opts.capabilities

    for server, server_opts in pairs(opts.servers) do
      server_opts.capabilities = capabilities
      if not (opts.setup and opts.setup[server] and opts.setup[server](server, server_opts)) then
        lspconfig[server].setup(server_opts)
      end
    end
  end,
}

