return {
  -- "rebelot/kanagawa.nvim",

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        italics = true,
        diagnostic_virtual_text = "grey",
        diagnostic_line_highlight = true,
        -- on_highlights = function(hl, palette)
        --   hl.TSDanger = {}
        -- end,
        -- on_highlights = function(hl, palette)
        --   hl.DiagnosticError = { fg = palette.none, bg = palette.none, sp = palette.red }
        --   hl.DiagnosticWarn = { fg = palette.none, bg = palette.none, sp = palette.yellow }
        --   hl.DiagnosticInfo = { fg = palette.none, bg = palette.none, sp = palette.blue }
        --   hl.DiagnosticHint = { fg = palette.none, bg = palette.none, sp = palette.green }
        -- end,
      })
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "moon",
      })
    end,
  },

  -- Configure LazyVim to load kanagawa
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "everforest",
      -- colorscheme = "kanagawa",
      colorscheme = "rose-pine",
    },
  },
}
