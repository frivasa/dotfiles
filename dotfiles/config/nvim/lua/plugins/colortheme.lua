-- return {}
return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_transparent_background = true
		vim.cmd.colorscheme("gruvbox-material")
		-- require("gruvbox-material").set()
		local bg_transparent = true
		local toggle_transparency = function()
			bg_transparent = not bg_transparent
			vim.g.gruvbox_material_transparent_background = bg_transparent
			vim.cmd([[colorscheme gruvbox-material]])
		end
		vim.keymap.set(
			"n",
			"<leader>bg",
			toggle_transparency,
			{ noremap = true, silent = true, desc = "Toggle [B][G] Transparency" }
		)
	end,
}
