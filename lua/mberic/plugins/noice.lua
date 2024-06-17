local noice_setup, noice = pcall(require, "noice")
if not noice_setup then
    print("No noice")
    return
end

print("Noice")
noice.setup({
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
    messages = {
      -- NOTE: If you enable messages, then the cmdline is enabled automatically.
      -- This is a current Neovim limitation.
      enabled = "true", -- enables the Noice messages UI
      view = "notify", -- default view for messages
      view_error = "notify", -- view for errors
      view_warn = "notify", -- view for warnings
      view_history = "messages", -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
})

require("notify").setup({
  background_colour = "#000000",
})

local keymap = vim.keymap
keymap.set("n", "<leader>nn", ":Noice dismiss<CR>")
keymap.set("n", "<leader>nt", ":Noice telescope<CR>")
