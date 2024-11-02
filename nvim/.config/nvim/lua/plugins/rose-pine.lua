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
                    ["@markup.italic.markdown_inline"] = { italic = true },
                },
            })

            vim.cmd("colorscheme rose-pine")
            vim.api.nvim_set_hl(0, "Visual", { nil,  nil, reverse = true })
        end,
    },
}
