require("core.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- colorschemes are inherited from kitty via pywal
require("lazy").setup({
	require("plugins.colorscheme-pywal"), -- pywal colorscheme integration
	require("plugins.lualine"), -- bottom bar config/colors
	require("plugins.treesitter"), -- reference finding ("open file with var/function")
	require("plugins.telescope"), -- file search and grep
	require("plugins.vim-tmux-navigator"), -- move around nvim+tmux splits
	require("plugins.gitsigns"), -- git symbols along gutter (change-add-delete symbols)
	require("plugins.ufo-folding"), -- code folding
	require("plugins.greeter"), -- add ascii poster and recent files on startup
	require("plugins.lsp"), -- language-specific hints and structures
	require("plugins.autocompletion"), -- lsp companion, fills in if-elses, for-loops, etc
	require("plugins.autoformat"), -- fix spacing/indents on a per-lang basis
	require("plugins.dap"), -- debugger
	require("plugins.ai-codecompanion"), -- ai features
	require("plugins.quarto"), -- quarto document/webpage dev
	require("plugins.bufferline"), -- top bar configuration ("show tabs")
	require("plugins.snacks"), -- group of QoL plugins
	-- image: show images/pdfs through kitty (nice)
	-- bigfile: disable some plugins with large files
	-- indent: mark indent lines and levels
	-- scroll: animate scrolling to make it smoother
	require("plugins.mini"), -- shitload of plugins
	-- files: yazi-like file browser
	-- splitjoin: swap arguments, bunch up or one-line parameters
	-- jump2d: key-hint navigation
	-- map: show overview of file (:lua MiniMap.open())
	require("plugins.other"), -- any other few-line plugins
	-- tpope/vim-surround (add chars around things)
	-- folke/which-key.nvim (keymap hints)
	-- folke/noice (notification/command pop-ups)
	-- windwp/nvim-autopairs (autoclose brackets)
	-- norcalli/nvim-colorizer (paint hex codes: #d7afaf)
})

require("core.keymaps")
require("core.autocommands")
