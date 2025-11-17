return {
    -- Mason plugin (LSP plugins management)
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = '✓',
                        package_pending = '➜',
                        package_uninstalled = '✗'
                    }
                }
            })
        end
    },

    -- Bridge between Mason and LSPConfig
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'rust_analyzer',
                    'gopls',
                }
            })
        end
    },

    -- LSPConfig
    {
        'neovim/nvim-lspconfig',
        config = function()
            vim.lsp.config["rust_analyzer"] = {
                settings = {
                    ['rust-analyzer'] = {},
                }
            }
            vim.lsp.config["gopls"] = {}
        end
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter').setup()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'rust',
                    'lua',
                    'go',
                },
                auto_install = true,
                highlight = {
                    enable = true,
                }
            })
        end
    },

    -- nvim-cmp (autocomplete)
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            cmp.setup({
              -- Enable LSP snippets
              snippet = {
                expand = function(args)
                    vim.fn['vsnip#anonymous'](args.body)
                end,
              },
              mapping = {
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                -- Add tab support
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.close(),
                ['<CR>'] = cmp.mapping.confirm({
                  behavior = cmp.ConfirmBehavior.Insert,
                  select = true,
                })
              },
              -- Installed sources:
              sources = {
                { name = 'path' },                              -- file paths
                { name = 'nvim_lsp', keyword_length = 1 },      -- from language server
                { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
                { name = 'nvim_lua', keyword_length = 1},       -- complete neovim's Lua runtime API such vim.lsp.*
                { name = 'buffer', keyword_length = 1 },        -- source current buffer
                { name = 'vsnip', keyword_length = 1 },         -- nvim-cmp source for vim-vsnip 
                { name = 'calc'},                               -- source for math calculation
              },
              window = {
                  completion = cmp.config.window.bordered(),
                  documentation = cmp.config.window.bordered(),
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
            })
        end
    },
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},
    {'hrsh7th/cmp-nvim-lsp-signature-help'},
    {'hrsh7th/cmp-vsnip'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/vim-vsnip'},

    -- Rust tools
    {
        'mrcjkb/rustaceanvim',
        version = '^6',
        lazy = false
    },

    -- Golang support
    {'ray-x/guihua.lua'},
    {
        'ray-x/go.nvim',
        dependencies = {
            'ray-x/guihua.lua',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('go').setup()
            vim.keymap.set(
               'n',
                '<C-space>',
                vim.lsp.buf.hover
                -- { buffer = bufnr }
            )
        end,
        event = {'CmdlineEnter'},
        ft = {'go', 'gomod'},
        build = ':lua require("go.install").update_all_sync()'
    },

}
