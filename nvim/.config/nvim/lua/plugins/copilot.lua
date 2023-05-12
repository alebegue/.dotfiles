return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_filetypes = { markdown = true, yaml = true, toml = true }
    end,
}
