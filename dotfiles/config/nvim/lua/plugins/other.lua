-- Standalone plugins with less than 10 lines of config go here
return {
	{ -- keybind hints
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			icons = { colors = true, group = "", separator = "", rules = false },
		},
		keys = {
			{
				"<leader>hl",
				function()
					require("which-key").show({ global = false, loop = true })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
			{
				"<leader>hg",
				function()
					require("which-key").show({ global = true, loop = true })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{ -- rename word udner cursor based on context
		"smjonas/inc-rename.nvim",
		opts = {},
	},
	{ -- notifications
		"folke/noice.nvim",
		event = "VeryLazy", -- load at end of init
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			messages = {
				view_error = "split",
				view_search = false,
			},
			popupmenu = { backend = "cmp" },
			lsp = {
				progress = { enabled = false },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- routes = {
			-- 	filter = {
			-- event = "lsp",
			-- kind = "progress",
			-- cond = function(message)
			-- 	local client = vim.tbl_get(message.opts, "progress", "client")
			-- 	return client == "pyright"
			-- end,
			-- filter = {
			-- 	event = "msg_show",
			-- 	any = {
			-- 		{ find = "%d+L, %d+B" },
			-- 		{ find = "; after #%d+" },
			-- 		{ find = "; before #%d+" },
			-- 	},
			-- },
			-- view = "mini",
			-- 	},
			-- },
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
	},
	-- opts = {
	-- 	routes = {
	-- 		{
	-- 			filter = {
	-- 				event = "lsp",
	-- 				kind = "progress",
	-- 				-- cond = function(message)
	-- 	local client = vim.tbl_get(message.opts, "progress", "client")
	-- 	return client == "pyright"
	-- end,
	-- },
	-- opts = { skip = true },
	-- },
	-- },
	-- },
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
	-- codecompanion add-ons (mostly markdown)
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			ft = { "markdown", "codecompanion" },
		},
	},
}
