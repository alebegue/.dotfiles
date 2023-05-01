return {
    "hrsh7th/nvim-cmp",
    cmd = "CmpStatus",
    config = function()
        local cmp = require("cmp")

        -- From: https://github.com/zbirenbaum/copilot-cmp#tab-completion-configuration-highly-recommended
        -- Unlike other completion sources, copilot can use other lines above or below an empty line to provide a completion.
        -- This can cause problematic for individuals that select menu entries with <TAB>. This behavior is configurable via
        -- cmp's config and the following code will make it so that the menu still appears normally, but tab will fallback
        -- to indenting unless a non-whitespace character has actually been typed.
        local has_words_before = function()
            if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
                return false
            end
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
        end

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-c>"] = cmp.mapping.abort(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    local luasnip = require("luasnip")

                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    elseif cmp.visible() and has_words_before() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        fallback()
                    end
                end),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    local luasnip = require("luasnip")

                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    elseif cmp.visible() and has_words_before() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end),
            }),
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })
    end,
    dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
        { "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
        { "rafamadriz/friendly-snippets" },
		{ "hrsh7th/cmp-path" },
    },
    -- event = "VeryLazy",
    event = "BufRead",
}
