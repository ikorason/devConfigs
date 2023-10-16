vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP keybindings',
  callback = function(event)
    local opts = {buffer = event.buf}
    -- Displays hover information about the symbol under the cursor 
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    -- Jump to the definition
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    -- Jump to declaration
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    -- Lists all the implementations for the symbol under the cursor
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    -- Jumps to the definition of the type symbol
    vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
    -- Lists all the references
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    -- Displays a function's signature information
    vim.keymap.set("i", "gs", function() vim.lsp.buf.signature_help() end, opts)
    -- Show diagnostics in a floating window
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
    -- Move to the previous diagnostic
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    -- Move to the next diagnostic
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  end
})

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'lua_ls',
    'rust_analyzer',
  },
  handlers = {
    function(server)
      lspconfig[server].setup({})
    end,
    lua_ls = function()
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = {'vim'}
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              }
            }
          }
        }
      })
    end
  }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

--- loads custom snippets from friendly-snippets
-- require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        { name = 'path' }, -- file paths
        { name = 'nvim_lsp', keyword_length = 1, priority = 10 }, -- from language server
        { name = 'crates', keyword_length = 1, priority = 10 },
        { name = 'luasnip', keyword_length = 1, priority = 7 }, -- for lua users
        { name = 'nvim_lsp_signature_help', priority = 8 }, -- display function signatures with current parameter emphasized
        { name = 'nvim_lua', keyword_length = 1, priority = 8 }, -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer', keyword_length = 1, priority = 5 }, -- source current buffer
        -- { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip
        { name = 'calc' }, -- source for math calculation
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    window = {
        completion = {
            cmp.config.window.bordered(),
            col_offset = 3,
            side_padding = 1,
        },
        documentation = cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon ={
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
    preselect = cmp.PreselectMode.None,
    confirmation = {
        get_commit_characters = function()
            return {}
        end
    },
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

