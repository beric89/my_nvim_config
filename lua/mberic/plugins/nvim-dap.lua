local status, dap = pcall(require, "dap")
if not status then
    return
end

local status, dap_ui = pcall(require, "dapui")
if not status then
    return
end

require "dapui".setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

-- Setting Python adapter
local status, dap_python = pcall(require, "dap-python")
if not status then
    return
end

dap_python.setup("~/.virtualenvs/debugpy/bin/python")
--table.insert(dap.configurations.python, {
--    type = "python",
--    request = "launch",
--    name = "My custom launch configuration",
--    program = "${file}",
--})

local keymap = vim.keymap
keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>")
keymap.set("n", "<leader>dc", ":lua require('dap').continue()<CR>")
keymap.set("n", "<leader>de", ":lua require('dapui').toggle()<CR>")
keymap.set("n", "<leader>dso", ":lua require('dapui').step_over()<CR>")
keymap.set("n", "<leader>dsi", ":lua require('dapui').step_into()<CR>")
keymap.set("n", "<leader>di", ":lua require('dapui').repl.open()<CR>")

--dap.setup({
--    config = function()
--        dap.listeners.before.attach.dapui_config = function()
--            dap_ui.open()
--        end
--        dap.listeners.before.launch.dapui_config = function()
--            dap_ui.open()
--        end
--        dap.listeners.before.event_terminated.dapui_config = function()
--            dap_ui.close()
--        end
--        dap.listeners.before.event_exited.dapui_config = function()
--            dap_ui.close()
--        end
--
--    end,
--})

--
--dap.adapters.lldb = {
--    type = 'executable',
--    command = 'lldb-vscode',
--    name = 'lldb'
--}
--
--dap.configurations.lua = {
--    {
--        type = "lldb",
--        request = "launch",
--        name = "Launch Lua",
--        program = "${file}",
--        args = {}
--    }
--}
--dap.setup()
--
--



