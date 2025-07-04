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
	-- { -- adds icons to file explorer but seems to do shit with mini.files
	-- 	"prichrd/netrw.nvim",
	-- 	opts = {},
	-- },
	{ -- rename word under cursor based on context
		"smjonas/inc-rename.nvim",
		opts = {},
	},
	-- { -- notifications
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy", -- load at end of init
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- 	opts = {
	-- 		messages = {
	-- 			view_error = "notify", -- notify
	-- 			view_search = false,
	-- 		},
	-- 		popupmenu = { backend = "blink" },
	-- 		lsp = {
	-- 			progress = { enabled = false },
	-- 			override = {
	-- 				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	-- 				["vim.lsp.util.stylize_markdown"] = true,
	-- 				-- this might not work with blink?
	-- 				["cmp.entry.get_documentation"] = true,
	-- 			},
	-- 		},
	-- 		presets = {
	-- 			bottom_search = true, -- use a classic bottom cmdline for search
	-- 			command_palette = false, -- position the cmdline and popupmenu together
	-- 			long_message_to_split = true, -- long messages will be sent to a split
	-- 			inc_rename = true, -- enables an input dialog for inc-rename.nvim
	-- 			lsp_doc_border = true, -- add a border to hover docs and signature help
	-- 		},
	-- 	},
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
	--	{ -- highlight keywords in comments
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
	{ -- codecompanion add-ons (mostly markdown)
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
		opts = {
			ft = { "markdown", "codecompanion" },
		},
	},
	{ -- see your undo/redos + diff, oh god this is beautiful
		"mbbill/undotree",
		lazy = false,
		config = function()
			vim.g.undotree_WindowLayout = 2
			vim.keymap.set("n", "<leader>tu", "<CMD>UndotreeToggle <CR>", { desc = "Toggle undo tree" }, opts)
		end,
	},
}
