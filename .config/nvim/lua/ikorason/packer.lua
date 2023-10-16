-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4', -- Fuzzy finder
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } } -- Collection of Lua functions
    }

    -- theme
    use { "catppuccin/nvim", as = "catppuccin" }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use 'nvim-treesitter/playground'

    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim' -- Manage LSPs and DAPs
    use 'williamboman/mason-lspconfig.nvim' -- closes gaps with mason
    use 'hrsh7th/nvim-cmp' -- Completion framework
    use 'hrsh7th/cmp-nvim-lsp' -- LSP completion source for nvim-cmp
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip' -- Snippet completion source for nvim-cmp
    use 'hrsh7th/cmp-path' -- Useful completion source
    use 'hrsh7th/cmp-buffer' -- Useful completion sources
    use 'hrsh7th/vim-vsnip' -- Snippet engine
    use 'saadparwaiz1/cmp_luasnip' -- snippets for completion
    use 'L3MON4D3/LuaSnip' -- snippets for completion
    use "rafamadriz/friendly-snippets"
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Vale as a prose linter
    use 'MunifTanjim/prettier.nvim' -- prettier format
    use 'simrat39/rust-tools.nvim' -- rust-analyzer hints and more!

    -- Autocomplete (), {}, []
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use "sindrets/diffview.nvim"
end)
