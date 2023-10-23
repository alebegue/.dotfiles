return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                            home = "~/notes/home",
                            work = "~/notes/work",
                        },
                    },
                },
            },
        }
        vim.opt.conceallevel = 3
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
}
