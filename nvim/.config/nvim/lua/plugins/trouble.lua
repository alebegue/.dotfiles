return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
    config = function()
        require("trouble").setup({})

        vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})

        vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})

        vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})

        vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})

        vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})

        vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true})

        local actions = require("telescope.actions")
        local trouble = require("trouble.providers.telescope")

        local telescope = require("telescope")

        telescope.setup {
            defaults = {
                mappings = {
                    i = { ["<C-T>"] = trouble.open_with_trouble },
                    n = { ["<C-T>"] = trouble.open_with_trouble },
                },
            },
        }
    end
}
