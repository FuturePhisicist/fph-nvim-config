return {
	"L3MON4D3/LuaSnip",
	dependencies = {
      "rafamadriz/friendly-snippets", -- optional: pre-made snippets
    },
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    event = "InsertEnter",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load() -- loads snippets from friendly-snippets or your own paths
    end,
}

