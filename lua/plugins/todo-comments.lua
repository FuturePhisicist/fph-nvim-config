return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufRead",
    opts = {
        keywords = {
            TODO = {
                icon = " ",
                color = "info",
                alt = { "MYTODO" },
            },
        },
		highlight = {
			before = "", -- "fg" or "bg" or empty
			keyword = "bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
			after = "fg", -- "fg" or "bg" or empty
        },
    },
    config = function(_, opts)
        require("todo-comments").setup(opts)
    end
}
