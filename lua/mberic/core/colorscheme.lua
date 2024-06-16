--vim.cmd("colorscheme forest_stream")
--vim.cmd("colorscheme wind")
vim.cmd("colorscheme papilio_dehaanii")

-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- local status, _ = pcall(vim.cmd, "colorscheme forest_stream")
--local status, _ = pcall(vim.cmd, "colorscheme wind")
local status, _ = pcall(vim.cmd, "colorscheme papilio_dehaanii")
if not status then
    print("Colorscheme not found!")
    return
end

vim.cmd([[ highlight MatchParen guifg=Yellow guibg=Black]])

vim.cmd([[ highlight Normal guibg=none ]])
vim.cmd([[ highlight NonText guibg=none ]])
vim.cmd([[ highlight Normal ctermbg=none ]])
vim.cmd([[ highlight NonText ctermbg=none ]])
