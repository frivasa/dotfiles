local wk = require("which-key")

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear Search Highlights" })
-- this might not work on tmux
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "-", ":lua MiniFiles.open()<CR>", { desc = "Open mini.file navigator (Oil)" })
-- For conciseness
local opts = { noremap = true, silent = true }
-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)
-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)
-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)
-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)
-- Vertical scroll and center
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)
-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", { desc = "close buffer" }, opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", { desc = "new scratch" }, opts) -- new buffer
-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window
-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move focus up" }, opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move focus down" }, opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move focus left" }, opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move focus right" }, opts)
-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab
-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set("n", "z?", ":setlocal spell!<CR>", { desc = "toggle spellcheck" }, opts)
vim.keymap.set("n", "zl", ":Telescope spell_suggest<CR>", { desc = "show spellcheck suggestions" }, opts)

-- Diagnostic/LSP keymaps
-- vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>qq", vim.diagnostic.setloclist, { desc = "Open diagnostics list" }, opts)
vim.keymap.set("n", "<C-LeftMouse>", ":lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" }, opts)

-- CodeCompanion keymaps
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", opts)
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", opts)
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", opts)
-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

-- REPL keymaps
vim.keymap.set("n", "<leader>isp", "<esc>i```{python}<cr>```<esc>O", { desc = "[i]nsert [s]nippet: [p]ython" })
vim.keymap.set("n", "<leader>isr", "<esc>i```{r}<cr>```<esc>O", { desc = "[i]nsert [s]nippet: [r]lang" })
vim.keymap.set("n", "<leader>isl", "<esc>i```{lua}<cr>```<esc>O", { desc = "[i]nsert [s]nippet: [l]ua" })

-- mini.map
vim.keymap.set("n", "<Leader>mr", ":lua MiniMap.refresh() <CR>", { desc = "[R]efresh mini-map" })
vim.keymap.set("n", "<Leader>mf", ":lua MiniMap.toggle_focus() <CR>", { desc = "mini-map [F]ocus" })
vim.keymap.set("n", "<Leader>mt", ":lua MiniMap.toggle() <CR>", { desc = "[T]oggle mini-map" })

-- MAKING QUARTO WORK
local function new_terminal(lang)
	vim.cmd("vsplit term://" .. lang)
end

local function new_terminal_python()
	new_terminal("python")
end
-- quarto magic
vim.keymap.set("n", "<leader>cp", new_terminal_python, { desc = "new [p]ython terminal" })

--- Send code to terminal with vim-slime
--- If an R terminal has been opend, this is in r_mode
--- and will handle python code via reticulate when sent
--- from a python chunk.
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

vim.keymap.set("v", "<CR>", send_region, { desc = "Run Code Region" })
vim.keymap.set("n", "<leader>rc", ":QuartoSend<CR>", { desc = "[R]un Code [C]ell" })
vim.keymap.set("n", "<leader>qp", ":QuartoPreview<CR>", { desc = "Start [Q]uarto [P]review" })
vim.keymap.set("n", "<leader>ra", ":QuartoSendAbove<CR>", { desc = "[R]un [A]bove To Cursor" })
-- vim.keymap.set("n", "<leader>qe", require("otter").export, { desc = "[E]xport code" })
