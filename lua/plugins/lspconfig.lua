return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local icons = {
      Error = " ",
      Warn  = " ",
      Hint  = " ",
      Info  = " ",
    }

    local diagnostic_signs = {
      { name = "DiagnosticSignError", text = icons.Error },
      { name = "DiagnosticSignWarn",  text = icons.Warn },
      { name = "DiagnosticSignHint",  text = icons.Hint },
      { name = "DiagnosticSignInfo",  text = icons.Info },
    }

    for _, sign in ipairs(diagnostic_signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    return {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = true,
      },

      inlay_hints = {
        enabled = true,
      },

      codelens = {
        enabled = false,
      },

      capabilities = vim.lsp.protocol.make_client_capabilities(),

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

      setup = {
        -- fallback example: ["*"] = function(server, opts) end
      },
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

