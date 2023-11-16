return {
  -- messages, cmdline and the popupmenu
  "folke/noice.nvim",
  opts = function(_, opts)
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = { skip = true },
    })

    opts.lsp = {
      progress = {
        enabled = true,
        format = {
          { "{data.progress.percentage} ", hl_group = "Comment" },
          { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.title} ", hl_group = "Comment" },
        },
        format_done = {},
        throttle = 1000 / 30,
        view = "mini",
      },
    }

    opts.presets = {
      bottom_search = false, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
    }

    opts.views = {
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
    }
  end,
}
