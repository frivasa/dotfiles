local vault_path = "/home/fdo/burbs/31.obsee/al-amin/"
return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = false,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- someday this wont be necesary, the plugin maintainer wants to setup an LSP
		{
			"hrsh7th/nvim-cmp",
			config = function()
				local cmp = require("cmp")
				cmp.setup({
					mapping = cmp.mapping.preset.insert({
						["<C-b>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-e>"] = cmp.mapping.abort(),
						["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					}),
				})
			end,
		},
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter",
	},
	opts = {
		workspaces = {
			{
				name = "al-amin",
				path = vault_path,
			},
		},
		notes_subdir = "_nvim-temps",
		new_notes_location = "notes_subdir",
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes.
			["<leader>tc"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true, desc = "Toggle Checkbox" },
			},
			-- Smart action depending on context, either follow link or toggle checkbox.
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
		preferred_link_style = "wiki",
		wiki_link_func = "prepend_note_path",
		disable_frontmatter = true, -- true: disable plugin from editing frontmatter
		picker = {
			name = "telescope.nvim",
			note_mappings = {
				new = "<C-x>", -- make a new note from query (?)
				insert_link = "<C-l>", -- insert link to highlighted note
			},
			tag_mappings = {
				tag_note = "<C-x>",
				insert_tag = "<C-l>",
			},
		},
		completion = {
			nvim_cmp = true,
			blink = true,
			min_chars = 2,
		},
		sort_by = "modified", -- path/accessed/created
		sort_reversed = true,
		open_notes_in = "vsplit",
		attachments = { img_folder = "_files/_img" },
	},
}
