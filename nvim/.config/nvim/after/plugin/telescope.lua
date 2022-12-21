local success, telescope = pcall(require, "telescope")
if not success then return end
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

require("telescope").load_extension("git_worktree")
