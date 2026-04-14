return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "chrisgrieser/nvim-recorder",
        "linrongbin16/lsp-progress.nvim",
    },

    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            vim.o.statusline = " "
        else
            vim.o.laststatus = 0
        end
    end,

    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = {
                left = "",
                right = "",
            },
            section_separators = {
                left = "",
                right = "",
            },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = true,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
                refresh_time = 16,
                events = {
                    "WinEnter",
                    "BufEnter",
                    "BufWritePost",
                    "SessionLoadPost",
                    "FileChangedShellPost",
                    "VimResized",
                    "Filetype",
                    "CursorMoved",
                    "CursorMovedI",
                    "ModeChanged",
                },
            },
        },

        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },

            lualine_c = {
                {
                    "filename",
                    path = 1,
                },
                function()
                    return require("lsp-progress").progress()
                end,
            },

            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = {
                "location",
                function()
                    return require("recorder").displaySlots()
                end,
            },
            lualine_z = {
                "progress",
                function()
                    return require("recorder").recordingStatus()
                end,
            },
        },

        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                {
                    "filename",
                    path = 1,
                },
            },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },

        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { "neo-tree", "lazy" },
    },

    config = function(_, opts)
        local lualine = require("lualine")
        lualine.setup(opts)

        vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
        vim.api.nvim_create_autocmd("User", {
            group = "lualine_augroup",
            pattern = "LspProgressStatusUpdated",
            callback = function()
                lualine.refresh()
            end,
        })
    end,
}

