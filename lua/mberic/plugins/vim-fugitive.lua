local setup, vim_fugitive = pcall(require, "vim-fugitive")
if not setup then
    return
end

print("Fugitive")
vim_fugitive.setup()
