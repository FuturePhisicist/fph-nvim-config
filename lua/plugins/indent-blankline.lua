return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
		indent = {
    		-- char = "│",         -- or "⸽", "▏", "┆"
    		-- tab_char = "→",     -- visually show tab characters if needed
    	},
    	whitespace = {
    		highlight = { "Whitespace" },
    		remove_blankline_trail = false,
		},
		exclude = {
    		filetypes = { "help", "dashboard", "lazy", "NvimTree" },
	    },
	},
}
