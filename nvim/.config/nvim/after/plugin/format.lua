vim.g.neoformat_enabled_python = {"black"}

vim.api.nvim_create_autocmd("BufWritePre", {
    command = "Neoformat",
})
