local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color of arrows
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF]])

local setup, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not setup then
    return
end

nvim_web_devicons.setup({
    override = {
        rs = {
            icon = "🦀",
            name = "Rust"
        }
   },
    default = true;
})

nvimtree.setup({
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "⮞", --icon when folder is closed
                    arrow_open = "⮟", --icon when folder is open

                },
            },
        },
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})

