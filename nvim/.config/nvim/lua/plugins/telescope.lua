return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                mappings = {
                    n = {
                        ["q"] = actions.close
                    },
                },
                file_ignore_patterns = { "^.git/", "^node_modules/"},
            },
            pickers = {
                live_grep = {
                    additional_args = function(opts)
                        return {"--hidden"}
                    end
                },
                grep_string = {
                    additional_args = function(opts)
                        return {"--hidden"}
                    end
                },
            },
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end,
}
