vim.g.lightline = {
    colorscheme = "tokyonight",
    active = { left = { { "mode", "paste" }, { "gitbranch", "readonly", "filename", "modified" } } },
    component_function = { gitbranch = "FugitiveHead" },
}
