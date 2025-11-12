return {
  "neovim/nvim-lspconfig",            -- optional now; can remove once you're comfy
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

    -- Inlay hints / codelens policy
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        if opts.inlay_hints and opts.inlay_hints.enabled == false then
          pcall(vim.lsp.inlay_hint.enable, false, args.buf)
        end
        if opts.codelens and opts.codelens.enabled == false then
          -- do nothing (disabled); if enabled later, you’d call vim.lsp.codelens.refresh()
        end
      end,
    })

    local capabilities = opts.capabilities or vim.lsp.protocol.make_client_capabilities()

    -- Minimal defaults per server (since we’re not using lspconfig’s presets)
    local defaults = {
      pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
      },
      clangd = {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_markers = { "compile_commands.json", ".clangd", ".git" },
      },
      bashls = {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh" },
        root_markers = { ".git" },
      },
      dockerls = {
        cmd = { "docker-langserver", "--stdio" },
        filetypes = { "dockerfile" },
        root_markers = { ".git" },
      },
      jsonls = {
        cmd = { "vscode-json-language-server", "--stdio" }, -- sometimes named "vscode-json-languageserver"
        filetypes = { "json", "jsonc" },
        root_markers = { "package.json", ".git" },
      },
    }

    -- Helper to compute root_dir on demand
    local function mk_root_dir(markers)
      return function(bufnr)
        return vim.fs.root(bufnr or 0, markers or { ".git" })
      end
    end

    -- Register each server with vim.lsp.config and auto-start on FileType
    for server, server_opts in pairs(opts.servers or {}) do
      local d = defaults[server] or {}
      local conf = vim.tbl_deep_extend("force", {
        name = server,
        cmd = d.cmd,                               -- must exist in PATH (or provide absolute path)
        capabilities = capabilities,
        filetypes = d.filetypes,                   -- required for our FileType autocmd below
        root_dir = mk_root_dir(d.root_markers),    -- set project root
        -- on_attach = your_on_attach,             -- add if you have one
        -- settings = server_opts.settings,        -- pass through custom settings
      }, server_opts)

      -- Register a named config; later we can start by name
      vim.lsp.config(server, conf)

      -- Start/attach when an eligible buffer opens
      if conf.filetypes and #conf.filetypes > 0 then
        vim.api.nvim_create_autocmd("FileType", {
          pattern = conf.filetypes,
          callback = function()
            -- Uses the named config we registered above
            vim.lsp.start({ name = server })
          end,
        })
      end

      -- Allow user-provided custom setup hook to short-circuit
      if opts.setup and opts.setup[server] then
        opts.setup[server](server, conf)
      end
    end
  end,
}

