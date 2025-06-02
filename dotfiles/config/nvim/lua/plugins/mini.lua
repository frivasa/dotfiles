return {
	"echasnovski/mini.nvim",
	config = function()
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
		require("mini.notify").setup()
		-- <leader>ENTER to jump by chars to position hints (noice)
		require("mini.jump2d").setup({
			mappings = { start_jumping = "g<CR>" },
		})
		-- require("mini.diff").setup({
		-- 	source = require("mini.diff").gen_source.none(),
		-- })
		-- might use in the future: these allow saving sessions and
		-- previously visited files/buffers
		-- require("mini.sessions")
		-- require("mini.visits")
	end,
}
