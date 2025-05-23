-- Standalone plugins with less than 10 lines of config go here
return {
	{ -- surround text with keys/brackets
		"tpope/vim-surround",
	},
	{ -- keybind hints
		"folke/which-key.nvim",
	},
	{
		"folke/noice.nvim",
		opts = {
			routes = {
				{
					filter = {
						event = "lsp",
						kind = "progress",
						-- cond = function(message)
						-- 	local client = vim.tbl_get(message.opts, "progress", "client")
						-- 	return client == "pyright"
						-- end,
					},
					-- opts = { skip = true },
				},
			},
		},
	},
	{ -- autoclose brackets
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {
			rgb_fn = true,
			mode = "foreground",
		},
	},
	--	{ -- highlight some keywords in comments
	--		"folke/todo-comments.nvim",
	--		event = "VimEnter",
	--		dependencies = { "nvim-lua/plenary.nvim" },
	--		opts = { signs = false },
	--	},
	{ -- color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
