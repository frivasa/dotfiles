return {
	"echasnovski/mini.nvim",
	config = function()
		-- pick (a)round and (i)nsert (ai)
		require("mini.ai").setup({ n_lines = 500 })
		-- oil-capable, yazi-like file browser overlay
		require("mini.files").setup({
			init = function()
				--skip
			end,
		})
		-- gx to swap selections (useful for swapping arguments)
		-- single fucntionality so not used for now
		-- require("mini.operators").setup()
		-- create custom tab-fillable snippets
		-- require("mini.snippets").setup()
		-- gS to split/join argument groups into one-per-line or all in a single one
		require("mini.splitjoin").setup()
		-- ENTER to jump by chars to position hints (noice)
		require("mini.jump2d").setup()
		-- require("mini.notify").setup()
		-- color scheme editor :lua require('mini.colors').interactive()
		-- kinda meh, does not work too well editing external themes
		-- require("mini.colors").setup()
		-- does not work? no :Mini* functions
		-- require("mini.map").setup()
		-- setup colors by hues
		-- require("mini.hues").setup({
		-- 	background = "#000000",
		-- 	foreground = "#afd7d7",
		-- 	n_hues = 3,
		-- 	saturation = "lowmedium",
		-- 	accent = "blue",
		-- })
		-- quick and simple 2 color theme, can specify all 16-colors
		-- require("mini.base16").setup({
		-- 	palette = require("mini.base16").mini_palette("#000000", "#afd7d7", 50),
		--     palette = { base00 = "#afd7d7", base01 = ..., base0F= "000000"}
		-- })
		-- might use in the future: these allow saving sessions and
		-- previously visited files/buffers
		-- require("mini.sessions")
		-- require("mini.visits")
	end,
}
