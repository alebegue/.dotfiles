-- Adapted from https://github.com/dsully/dotfiles/blob/master/.config/nvim/lua/plugins/lsp/init.lua
local M = {}

local common = require("plugins.lsp.common")

M.handlers = {
    -- Default handler for mason-lspconfig.
    function(name)
        require("lspconfig")[name].setup({
            capabilities = common.capabilities(),
            on_attach = common.on_attach,
        })
    end,
    ["pylsp"] = function()
        require("lspconfig").pylsp.setup({
            capabilities = common.capabilities(),
            cmd = { "pylsp", "--check-parent-process" },
            on_attach = common.on_attach,
            settings = {
                pylsp = {
                    plugins = {
                        ruff = {
                            enabled = true,
                            extendSelect = { "I" },
                        },
                        black = {
                            enabled = true,
                            line_length = 88,
                        },
                        autopep8 = { enabled = false },
                        yapf = { enabled = false },
                    },
                },
            },
        })
    end,
}

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason.nvim", "mason-lspconfig.nvim" },
        event = { "BufReadPre", "BufNewFile" },
    },
    -- Mason related packages follow.
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall" },
        config = function()
            require("mason").setup({
                ui = {
                    border = vim.g.border,
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                    },
                },
            })

            require("mason-registry"):on("package:install:success", require("plugins.lsp.python").mason_post_install)
        end,
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            automatic_installation = true,
            handlers = M.handlers,
        },
    },
    {
        "microsoft/python-type-stubs",
        ft = "python"
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                automatic_setup = true,
            })
        end,
    },
}
