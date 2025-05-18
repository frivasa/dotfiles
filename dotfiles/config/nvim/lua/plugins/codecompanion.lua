return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				ollama = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "http://127.0.0.1:8090", -- optional: default value is ollama url http://127.0.0.1:11434
							chat_url = "/v1/chat/completions", -- optional: default value, override if different
						},
						schema = {
							model = {
								default = "llama3.1:8b",
							},
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "ollama",
				},
				inline = {
					adapter = "ollama",
				},
				cmd = {
					adapter = "ollama",
				},
			},
		})
	end,
}
