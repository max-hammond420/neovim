-- use this table to disable/enable filetypes
vim.g.copilot_filetypes = { xml = false }

vim.cmd [[
  inoremap <silent><script><expr> <C-y> copilot#Accept("\<CR>")
]]
vim.g.copilot_no_tab_map = true
--                                                 *copilot-i_ALT-]*
-- <M-]>                   Cycle to the next suggestion, if one is available.
-- <Plug>(copilot-next)
--
--                                                 *copilot-i_ALT-[*
-- <M-[>                   Cycle to the previous suggestion.
-- <Plug>(copilot-previous)


vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
