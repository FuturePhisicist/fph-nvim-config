return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "linrongbin16/lsp-progress.nvim",
  },

  opts = {
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
      pyright = {
        -- filetypes = { "python" },
        single_file_support = true,
      },
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--log=error",
          -- filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        },
        single_file_support = true,
      },
      bashls = {},
      dockerls = {},
      jsonls = {},
      rust_analyzer = {},
      postgres_lsp = {},
      -- NOTE: Java is managed separately in its own plugin
      racket_langserver = {
        cmd = { "racket", "-l", "racket-langserver" },
        filetypes = { "racket" },
        single_file_support = true,
      },
    },

    -- Optional custom setups
    setup = {
      -- jdtls = function()
      --   return true
      -- end,
	},
  },

  config = function(_, opts)
    local mason_lspconfig = require("mason-lspconfig")

    -- diagnostics
    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    -- inlay hints (simple global toggle)
    if not opts.inlay_hints.enabled then
      vim.lsp.inlay_hint.enable(false)
    end

    -- codelens (you can hook this into autocmds if you want later)
    if not opts.codelens.enabled then
      -- nothing to do by default – left here for symmetry
    end

    local mason_servers = vim.tbl_filter(function(server)
      return server ~= "racket_langserver"
    end, vim.tbl_keys(opts.servers))

    mason_lspconfig.setup({
      ensure_installed = mason_servers,
      automatic_enable = false,
    })

    local capabilities = opts.capabilities

    for server, server_opts in pairs(opts.servers) do
      local final_opts = vim.tbl_deep_extend("force", {
        capabilities = capabilities,
      }, server_opts or {})

      if not (opts.setup and opts.setup[server] and opts.setup[server](server, final_opts)) then
        vim.lsp.config(server, final_opts)
        vim.lsp.enable(server)
      end
    end
  end,
}

