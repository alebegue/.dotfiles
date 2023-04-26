local success, ts_configs = pcall(require, "nvim-treesitter.configs")
if not success then return end

ts_configs.setup {
    ensure_installed = { "bash", "c", "cpp", "fish", "java", "javascript", "julia", "latex", "lua", "markdown", "python", "r", "rust", "typescript" },

    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

}
