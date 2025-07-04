return { -- Autocompletion
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"Kaiser-Yang/blink-cmp-avante",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		--`friendly-snippets` contains a variety of premade snippets. https://github.com/rafamadriz/friendly-snippets
		"rafamadriz/friendly-snippets",
		"folke/lazydev.nvim",
	},
	opts = {
		keymap = {
			preset = "default",
		},
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},
		completion = {
			-- By default, you may press `<c-space>` to show the documentation.
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				treesitter_highlighting = true,
			},
		},
		sources = {
			default = { "avante", "lsp", "path", "snippets", "lazydev" },
			providers = {
				lazydev = {
					module = "lazydev.integrations.blink",
					name = "lz-dev",
					score_offset = 100,
				},
				avante = { module = "blink-cmp-avante", name = "Avante" },
			},
		},
		snippets = { preset = "luasnip" },
		-- the rust implementation via `'prefer_rust_with_warning'`
		fuzzy = { implementation = "prefer_rust_with_warning" },
		-- Shows a signature help window while you type arguments for a function
		-- signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
