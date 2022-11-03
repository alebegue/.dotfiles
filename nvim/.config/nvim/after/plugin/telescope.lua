local success, telescope = pcall(require, "telescope")
if not success then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require("telescope").extensions.file_browser.actions

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
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function() vim.cmd('normal vbd') end,
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd('startinsert')
                    end
                },
            },
        },
    },
})

telescope.load_extension("file_browser")

-- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
-- vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

vim.keymap.set('n', '<leader>ff',
    function()
        builtin.find_files({
            no_ignore = false,
            hidden = true
        })
    end
)
vim.keymap.set('n', '<leader>fg', function()
    builtin.live_grep()
end)
vim.keymap.set('n', '<leader>fb', function()
    builtin.buffers()
end)
vim.keymap.set('n', '<leader>fh', function()
    builtin.help_tags()
end)
vim.keymap.set('n', ';;', function()
    builtin.resume()
end)
vim.keymap.set('n', ';e', function()
    builtin.diagnostics()
end)
vim.keymap.set("n", "<leader>sf",
    function()
        telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 }
        })
    end
)