return {
    {
        "rose-pine/neovim",
        name = "rose-pine", 
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "main",
                disable_background = true,
                disable_float_background = false,
                disable_italics = true
            })

            vim.cmd([[colorscheme rose-pine]])
        end,
    },
}
