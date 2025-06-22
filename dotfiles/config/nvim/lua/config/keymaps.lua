local wk = require("which-key")
local icons = require("mini.icons")
local opts = { noremap = true, silent = true }
local nor = { mode = "n", opts }
local vis = { mode = "v", opts }
-- noremap = nor+vis+select+operator (allows "repeatability")
-- Aux Functions
local function new_terminal(lang)
	vim.cmd("vsplit term://" .. lang)
end

local function new_terminal_python()
	new_terminal("python")
end

local slime_send_region_cmd = ":<C-u>call slime#send_op(visualmode(), 1)<CR>"
slime_send_region_cmd = vim.api.nvim_replace_termcodes(slime_send_region_cmd, true, false, true)
local function send_region()
	-- if filetyps is not quarto, just send_region
	if vim.bo.filetype ~= "quarto" or vim.b["quarto_is_r_mode"] == nil then
		vim.cmd("normal" .. slime_send_region_cmd)
		return
	end
	if vim.b["quarto_is_r_mode"] == true then
		vim.g.slime_python_ipython = 0
		local is_python = require("otter.tools.functions").is_otter_language_context("python")
		if is_python and not vim.b["reticulate_running"] then
			vim.fn["slime#send"]("reticulate::repl_python()" .. "\r")
			vim.b["reticulate_running"] = true
		end
		if not is_python and vim.b["reticulate_running"] then
			vim.fn["slime#send"]("exit" .. "\r")
			vim.b["reticulate_running"] = false
		end
		vim.cmd("normal" .. slime_send_region_cmd)
	end
end

-- command is really picky, put it close to the function so that it works
wk.add({
	{ "<CR>", send_region, desc = "Run Code Region", mode = "v" },
})

-- "local" keymaps
wk.add({
	{ "<C-h>", "<CMD>wincmd h<CR>", desc = "Move Left", nor },
	{ "<C-j>", "<CMD>wincmd j<CR>", desc = "Move Down", nor },
	{ "<C-k>", "<CMD>wincmd k<CR>", desc = "Move Up", nor },
	{ "<C-l>", "<CMD>wincmd l<CR>", desc = "Move Right", nor },
	{ "<C-q>", "<CMD>q<CR>", desc = "Quit File", nor },
	{ "<C-s>", "<CMD>w<CR>", desc = "Save File", nor },
	{ "<S-Tab>", "<CMD>bprevious<CR>", desc = "Prev Buffer", nor },
	{ "<Tab>", "<CMD>bnext<CR>", desc = "Next Buffer", nor },
	{ "<ESC>", "<CMD>nohlsearch<CR>", desc = "Clear Search Highlights", nor },
	{ "x", '"_x', desc = "Delete without copying", nor },
	{ "n", "nzzzv", desc = "center word search", nor },
	{ "N", "Nzzzv", desc = "center backwards word search", nor },
	{ "<C-d>", "<C-d>zz", desc = "scroll down and center", nor },
	{ "<C-u>", "<C-u>zz", desc = "scroll up and center", nor },
	{ "<C-LeftMouse>", "<CMD>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition", nor },
	{ "<", "<gv", desc = "indent repeatedly leftward", nor },
	{ ">", ">gv", desc = "indent repeatedly righward", nor },
	{ "<Up>", ":resize -2<CR>", desc = "nudge pane upwards", nor },
	{ "<Down>", ":resize +2<CR>", desc = "nudge pane downwards", nor },
	{ "<Left>", ":vertical resize -2<CR>", desc = "nudge pane leftwards", nor },
	{ "<Right>", ":vertical resize +2<CR>", desc = "nudge pane rightwards", nor },
})

wk.add({
	{ "<Space>", "<NOP>", mode = { "n", "v" }, opts },
	{ "<leader>h", group = "Help", icon = { icon = "󰰀 ", color = "purple" } },
	{ "<leader>hm", "<CMD>messages<CR>", desc = "Show Message History", nor },
	{ "<leader>a", group = "Bots", icon = { icon = " ", color = "purple" } },
	-- { "<C-a>", "<CMD>CodeCompanionActions<CR>", desc = "CodeCompanion Actions", mode = { "n", "v" }, opts },
	-- { "<leader>aa", "<CMD>CodeCompanionChat Add<CR>", desc = "Add Chat Input", vis },
	{ "<leader>r", group = "Replace", icon = { icon = "󰰞 ", color = "purple" } },
	{
		"<leader>rn",
		function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end,
		desc = "Rename word under cursor",
		expr = true,
		nor,
	},
	{ "<leader>i", group = "Insert", icon = { icon = "󰰃 ", color = "purple" } },
	{ "<leader>iz", "<CMD>Telescope spell_suggest<CR>", desc = "Spell Suggestions", nor },
	{ "<leader>is", group = "Snippets", icon = { icon = "󰅩 ", color = "yellow" } },
	{ "<leader>isl", "<ESC>i```{lua}<cr>```<ESC>O", desc = "Lua", nor },
	{ "<leader>isp", "<ESC>i```{python}<cr>```<ESC>O", desc = "Python", nor },
	{ "<leader>isr", "<ESC>i```{r}<cr>```<ESC>O", desc = "R", nor },
	{ "<leader>d", group = "Debug", icon = { icon = "󰨰 ", color = "purple" } },
	{ "<leader>dqq", vim.diagnostic.setloclist, desc = "Diagnostics List", nor },
	{ "<leader>dqf", vim.diagnostic.open_float, desc = "Diagnostics List (float)", nor },
	{ "<leader>q", group = "Quarto", icon = { icon = "󱡓 ", color = "purple" } },
	{ "<leader>qp", "<CMD>QuartoPreview<CR>", desc = "Preview", nor },
	{ "<leader>qa", "<CMD>QuartoSendAbove<CR>", desc = "Run Above", nor },
	{ "<leader>qc", "<CMD>QuartoSend<CR>", desc = "Run Cell", nor },
	{ "<leader>qe", require("otter").export, desc = "[E]xport code to file", nor },
	{ "<leader>g", group = "Guardar", icon = { icon = " ", color = "purple" } },
	{ "<leader>gn", "<CMD>noautocmd w<CR>", desc = "Save w/o Formatting", nor },
	{ "<leader>r", group = "Run", icon = { icon = " ", color = "purple" } },
	{ "<leader>s", group = "Search (Telescope)", icon = { icon = " ", color = "purple" } },
	{ "<leader>m", group = "Mvmt", icon = { icon = "󰜎 ", color = "purple" } },
	{ "<leader>mn", "<CMD>tabn<CR>", desc = "Next Tab", nor },
	{ "<leader>mp", "<CMD>tabp<CR>", desc = "Prev Tab", nor },
	{ "<leader>o", group = "Open/Splits", icon = { icon = "󰠜 ", color = "purple" } },
	{ "<leader>ob", "<CMD>enew<CR>", desc = "New Scratch Buffer", nor },
	{ "<leader>ot", "<CMD>tabnew<CR>", desc = "New Tab", nor },
	{ "<leader>ov", "<C-w>v", desc = "Vertical Split", nor },
	{ "<leader>oh", "<C-w>s", desc = "Horizontal Split", nor },
	{ "<leader>op", new_terminal_python, desc = "new [p]ython terminal", nor },
	{ "<leader>of", ":lua MiniFiles.open()<CR>", desc = "File Browser (MiniFiles)", nor },
	{ "<leader>x", group = "Close", icon = { icon = "󰰰 ", color = "purple" } },
	{ "<leader>xt", "<CMD>tabclose<CR>", desc = "Close Tab", nor },
	{ "<leader>xx", "<CMD>bdelete!<CR>", desc = "Close Buffer", nor },
	{ "<leader>xs", "<CMD>close<CR>", desc = "Close Split", nor },
	{ "<leader>t", group = "Toggles", icon = { icon = "󰨚 ", color = "purple" } },
	-- { "<leader>tc", "<CMD>CodeCompanionChat Toggle<CR>", desc = "Toggle Chat", mode = { "n", "v" }, opts },
	{ "<leader>te", "<C-w>=", desc = "Equalize Splits", nor },
	{ "<leader>tp", "<CMD>BufferLineTogglePin <CR>", desc = "Toggle Pinned", mode = { "n", "v" }, opts },
	{ "<leader>tw", "<CMD>set wrap!<CR>", desc = "Toggle Wrap", nor },
	{ "<leader>tz", "<CMD>setlocal spell!<CR>", desc = "Toggle Spellcheck", nor },
})
