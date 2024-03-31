return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                styles = {
                    italic = false,
                    transparency = true,
                },
                highlight_groups = {
                    MarkdownItalic = { italic = true },
                    MarkdownBold = { bold = true },
                },
            })

            vim.cmd("colorscheme rose-pine")
        end,
    },
}
