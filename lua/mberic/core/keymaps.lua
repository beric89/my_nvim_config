vim.g.mapleader = " "

local keymap = vim.keymap

--genreal keymaps
keymap.set("n", "<leader><ESC>", ":nohl<CR>")
keymap.set("n", "x", '"_x') -- not to copy deleted character into cliplboard

keymap.set("n", "<leader>=", "<C-a>") -- increment number
keymap.set("n", "<leader>-", "<C-x>") -- decrement number

keymap.set("n", "<leader>s", ":w<CR>")

keymap.set("n", "<leader>wv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=") -- make split window equal
keymap.set("n", "<leader>wx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")


-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

keymap.set("n", "gd", "lua vim.lsp.buf.definition()<CR>")

-- debugger
keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>")
keymap.set("n", "<leader>dc", ":lua require('dap').continue()<CR>")
keymap.set("n", "<leader>de", ":lua require('dapui').toggle()<CR>")
keymap.set("n", "<leader>dso", ":lua require('dapui').step_over()<CR>")
keymap.set("n", "<leader>dsi", ":lua require('dapui').step_into()<CR>")

