return {
    "itchyny/lightline.vim",
    config = function()
        vim.g.lightline = {
            colorscheme = "rosepine",
            active = { left = { { "mode", "paste" }, { "gitbranch", "readonly", "filename", "modified" } } },
            component_function = { gitbranch = "FugitiveHead" },
        }
    end,
}
