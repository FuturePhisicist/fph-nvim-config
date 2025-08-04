return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
    	-- Automatically install all servers listed in `lspconfig`
    	ensure_installed = {
			"pyright",
	    	"clangd",
	    	"bashls",
	    	"dockerls",
	    	"jsonls",
    	},
    	automatic_installation = true,
	},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
