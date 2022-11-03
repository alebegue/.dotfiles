require("tokyonight").setup({
    style = "night",
    transparent = true,
    styles = {
        functions = {},
        keywords = { italic = false },
        comments = { italic = false },
        -- floats = "transparent",
        -- sidebars = "transparent"
    },
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
    day_brightness = 0.3,
    on_colors = function(colors)
        colors.bg_statusline = "#1f2335"
        -- colors.bg_float = "#272727"
    end,
})

vim.cmd[[colorscheme tokyonight]]

-- vim.cmd[[
--     " gray
--     highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
--     " blue
--     highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
--     highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
--     " light blue
--     highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
--     highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
--     highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
--     " pink
--     highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
--     highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
--     " front
--     highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
--     highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
--     highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
-- ]]
