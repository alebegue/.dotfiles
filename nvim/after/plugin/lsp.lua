-- Setup nvim-cmp

local Remap = require("configs.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}


local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    luasnip = "[LuaSnip]",
    nvim_lua = "[Lua]",
    latex_symbols = "[LaTeX]",
    cmp_tabnine = "[TN]",
    path = "[Path]",
}

local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-M-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-M-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    },
    formatting = {
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            -- Source
            local menu = source_mapping[entry.source.name]
            if entry.source.name == "cmp_tabnine" then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. " " .. menu
                end
                vim_item.kind = ""
            end
            vim_item.menu = menu
            return vim_item
        end
    },
    sources = cmp.config.sources({
        { name = "cmp_tabnine" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    })
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

local function on_attach()
    nnoremap("gd", function() vim.lsp.buf.definition() end)
    nnoremap("K", function() vim.lsp.buf.hover() end)
    nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
    nnoremap("<leader>vd", function() vim.diagnostic.open_float(nil, {border="rounded"}) end)
    nnoremap("[d", function() vim.diagnostic.goto_next({float={border="rounded"}}) end)
    nnoremap("]d", function() vim.diagnostic.goto_prev({float={border="rounded"}}) end)
    nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
    nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
    nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
    inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
end

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach,
    }, _config or {})
end

-- Setup Python
local python_root_files = {
    ".git",
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "Pipfile",
    "pyrightconfig.json",
}

require("lspconfig").pyright.setup(config({
    root_dir = require("lspconfig").util.root_pattern(unpack(python_root_files)),
}))

-- Setup Rust
require("rust-tools").setup({
    server = {
        on_attach = on_attach
    }
})
