return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
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
                extensions = {
                    --fzf = {
                    --  fuzzy = true,                    -- false will only do exact matching
                    --  override_generic_sorter = true,  -- override the generic sorter
                    --  override_file_sorter = true,     -- override the file sorter
                    --  case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    --                                   -- the default case_mode is "smart_case"
                    --},
                },
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            vim.keymap.set("n", "<leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)
            vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
            vim.keymap.set("n", "<leader>vb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>pws", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)
            require("telescope").load_extension("fzf")
        end,
    }
}
