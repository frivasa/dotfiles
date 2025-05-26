-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
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
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
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
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer
-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window
-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move focus up" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move focus down" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move focus left" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move focus right" })
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
-- Diagnostic keymaps
-- vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- CodeCompanion keymaps
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

-- REPL keymaps
-- vim.keymap.set({ "n", "i" }, "<m-i>", "<esc>i```{python}<cr>```<esc>O", { desc = "[i]nsert code chunk" })
vim.keymap.set({ "n" }, "<leader>ci", ":vsplit  term://ipython<cr>", { desc = "[c]ode repl [i]python" })
-- pyrepl keymaps
-- vim.keymap.set("n", [your keymap], function() require('nvim-python-repl').send_statement_definition() end, { desc = "Send semantic unit to REPL"})
vim.keymap.set("v", "<leader>sv", function()
	require("nvim-python-repl").send_visual_to_repl()
end, { desc = "Send visual selection to REPL" })
-- vim.keymap.set("n", [your keyamp], function() require('nvim-python-repl').send_buffer_to_repl() end, { desc = "Send entire buffer to REPL"})
-- vim.keymap.set("n", [your keymap], function() require('nvim-python-repl').toggle_execute() end, { desc = "Automatically execute command in REPL after sent"})
vim.keymap.set("n", "<leader>ors", function()
	require("nvim-python-repl").toggle_vertical()
end, { desc = "Create REPL in vertical or horizontal split" })
vim.keymap.set("n", "<leader>orv", function()
	require("nvim-python-repl").open_repl()
end, { desc = "Opens the REPL in a window split" })
-- vim.keymap.set("n", "<Leader>mc", MiniMap.close)
-- vim.keymap.set("n", "<Leader>mf", MiniMap.toggle_focus)
-- vim.keymap.set("n", "<Leader>mo", MiniMap.open)
-- vim.keymap.set("n", "<Leader>mr", MiniMap.refresh)
-- vim.keymap.set("n", "<Leader>ms", MiniMap.toggle_side)
-- vim.keymap.set("n", "<Leader>mt", MiniMap.toggle)
-- slap your wrist
-- vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
