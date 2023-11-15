return {
  -- messages, cmdline and the popupmenu
  "folke/noice.nvim",
  opts = function(_, opts)
    opts.presets.lsp_doc_border = true
  end,
  config = function()
    require("noice").setup({
      views = {
        mini = {
          position = {
            row = -1,
            col = "100%",
          },
        },
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 1, 2 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
    })
  end,
}
