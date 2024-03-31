return {
    "epwalsh/obsidian.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = true,
    keys = {
        { "<leader>otd", "<cmd>ObsidianToday<cr>", desc = "[O]bsidian [t]o[d]ay" },
        { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "[O]bsidian [O]pen"},
        { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "[O]bsidian [S]earch"},
        { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "[O]bsidian [T]ags"},
        { "<leader>od", "<cmd>ObsidianDailies<cr>", desc = "[O]bsidian [D]ailies"},
        { "<leader>ow", "<cmd>ObsidianWorkspace<cr>", desc = "[O]bsidian [W]orkspace"},
        { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "[O]bsidian [N]ew"},
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/notes/personal",
                overrides = {
                    notes_subdir = "./personal/notes",
                    daily_notes = {
                        folder = "./personal/dailies",
                    },
                },
            },
            {
                name = "work",
                path = "~/notes/work",
                overrides = {
                    notes_subdir = "./work/notes",
                    daily_notes = {
                        folder = "./work/dailies",
                    },
                },
            },
        },
        daily_notes = {
            date_format = "%Y-%m-%d",
            alias_format = "%B %-d, %Y",
            template = nil
        },
        note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- In this case a note with the title 'My new note' will be given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            local suffix = ""
            if title ~= nil then
                -- If title is given, transform it into valid file name.
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                -- If title is nil, just add 4 random uppercase letters to the suffix.
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.date("%Y-%m-%d", os.time())) .. "-" .. suffix
        end,
        follow_url_func = function(url)
            vim.fn.jobstart({"xdg-open", url})  -- linux
        end,
    },
}
