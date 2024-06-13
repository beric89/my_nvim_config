local function configure_semshi_highlights()
  vim.cmd('highlight semshiLocal guifg=#4a83d4')
  vim.cmd('highlight semshiGlobal guifg=#398f93')
  vim.cmd('highlight semshiImported guifg=#398f93 gui=bold')
  vim.cmd('highlight semshiParameter guifg=#4a83d4')
  vim.cmd('highlight semshiParameterUnused guifg=#404954 gui=underline')
  vim.cmd('highlight semshiFree guifg=#832543')
  vim.cmd('highlight semshiBuiltin guifg=#db40bf')
  vim.cmd('highlight semshiAttribute guifg=#84b1b6')
  vim.cmd('highlight semshiSelf guifg=#a8b2bd')
  vim.cmd('highlight semshiUnresolved guifg=#f3346b gui=underline')
  vim.cmd('highlight semshiSelected guifg=#ffffff guibg=#832543')
  vim.cmd('highlight semshiErrorSign guifg=#ffffff guibg=#832543')
  vim.cmd('highlight semshiErrorChar guifg=#ffffff guibg=#832543')
  vim.cmd('highlight semshiFunction guifg=#8cabd7')
  vim.cmd('sign define semshiError text=E> texthl=semshiErrorSign')
end

-- Set an autocmd group to configure highlights on colorscheme change
vim.cmd([[
  augroup SemshiCustomHighlights
    autocmd!
    autocmd ColorScheme * lua configure_semshi_highlights()
  augroup END
]])

-- Call the function to set highlights initially
configure_semshi_highlights()

--vim.g['semshi#simplify_markup'] = false
--vim.g['semshi#no_default_builtin_highlight'] = false
