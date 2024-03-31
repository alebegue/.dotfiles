return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "cpp",
                    "fish",
                    "javascript",
                    "julia",
                    "latex",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "r",
                    "rust",
                    "typescript",
                    "vimdoc",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context"
    }
}
