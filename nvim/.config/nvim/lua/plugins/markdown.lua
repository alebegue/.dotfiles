return {
    "plasticboy/vim-markdown",
    dependencies = { "godlygeek/tabular" },
    branch = "master",
    lazy = true,
    event = {
        "BufReadPre " .. vim.fn.expand "~" .. "/vaults/**.md",
        "BufNewFile " .. vim.fn.expand "~" .. "/vaults/**.md"
    },
    config = function()
        vim.g.vim_markdown_conceal = 2
        vim.g.vim_markdown_folding_disabled = 1
        vim.g.vim_markdown_frontmatter = 1
        vim.g.vim_markdown_math = 0
        vim.g.vim_markdown_borderless_table = 1
    end,
}
