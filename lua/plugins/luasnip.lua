vim.cmd[[
    " Use Tab to expand and jump through snippets
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
    smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

    " Use Shift-Tab to jump backwards through snippets
    imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

-- direct all snippers to nvim/LuaSnip
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

require("luasnip").config.set_config({ -- Setting LuaSnip config
    -- Don't store snippet history for less overhead
    history = false,
    -- Allow autotrigger snippets
    enable_autosnippets = true,
    -- For equivalent of UltiSnips visual selection
    store_selection_keys = "<Tab>",
})
