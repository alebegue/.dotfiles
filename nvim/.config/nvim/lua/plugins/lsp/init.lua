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
          local venv_path = os.getenv('VIRTUAL_ENV')
          local py_path = nil
          -- decide which python executable to use for mypy
          if venv_path ~= nil then
              py_path = venv_path .. "/bin/python3"
          else
              py_path = vim.g.python3_host_prog
          end
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
                        pycodestyle = { enabled = false },
                        pylsp_mypy = {
                            enabled = true,
                            overrides = { "--python-executable", py_path, true },
                            report_progress = true,
                            live_mode = false,
                            strict = true,
                        },
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
