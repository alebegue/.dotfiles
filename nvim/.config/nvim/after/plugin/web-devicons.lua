local success, icons = pcall(require, "nvim-web-devicons")
if not success then return end

icons.setup({
    override = {
    },
    default = true
})
