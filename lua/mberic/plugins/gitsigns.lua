local status, gitsigns = pcall(require, "gitsigns")
if not status then
    return
end

gitsigns.setup()

local keymap = vim.keymap
keymap.set("n", "<leader><ESC>", ":nohl<CR>")
--map('n', '<leader>hs', gitsigns.stage_hunk)
--map('n', '<leader>hr', gitsigns.reset_hunk)
--map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
--map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
--map('n', '<leader>hS', gitsigns.stage_buffer)
--map('n', '<leader>hu', gitsigns.undo_stage_hunk)
--map('n', '<leader>hR', gitsigns.reset_buffer)
keymap.set("n", '<leader>gh', gitsigns.preview_hunk)
keymap.set("n", '<leader>gb', function() gitsigns.blame_line{full=true} end)
keymap.set("n", '<leader>gt', gitsigns.toggle_current_line_blame)
--map('n', '<leader>hd', gitsigns.diffthis)
--map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
keymap.set("n", '<leader>gd', gitsigns.toggle_deleted)
