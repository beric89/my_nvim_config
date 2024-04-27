local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local keymap = vim.keymap

-- enable keybinds for available lsp server
local on_attach = function(client, bufnr)
    -- set keybinds
    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- TODO not working
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap.set("n", "gd", "<Cmd>Lspsaga peek_definition()<CR>", opts) -- TODO not working
    keymap.set("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- TODO not working
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    keymap.set("n", "<leader>rn", "<Cmd>Lspsaga rename<CR>", opts)
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["bashls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
lspconfig["jsonls"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
lspconfig["taplo"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
        Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})
