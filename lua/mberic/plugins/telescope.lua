local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    return
end

local telescope_config = require("telescope.config")
local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }
-- table.insert(vimgrep_arguments, "--hidden") -- If I want to see hidden files
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/devices/*")

telescope.setup({
    defaults = {
        vimgrep_arguments = vimgrep_arguments,
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            }
        }
    }
})

local setup_neoclip, neoclip = pcall(require, "neoclip")
if not setup_neoclip then
    print("neoclip not installed")
end
neoclip.setup()

local keymap = vim.keymap
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fr", "<cmd>Telescope resume<CR>")
keymap.set("n", "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = "Live Grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under Cursor" })
keymap.set("n", "<leader>fo", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fi", "<cmd>AdvancedGitSearch<CR>", { desc = "AdvancedGitSearch" })
vim.keymap.set("n", "<leader>fcb", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
vim.keymap.set("n", "<leader>fcc", builtin.git_commits, { desc = "Search Git Commits" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
vim.keymap.set("n", "<leader>fn", "<cmd>Telescope neoclip<CR>", { desc = "Find in Clipboard" })

telescope.load_extension("fzf")
telescope.load_extension("advanced_git_search")
telescope.load_extension("live_grep_args")
telescope.load_extension("neoclip")
