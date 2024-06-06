return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- lua stuff
        "lua-language-server",
        "stylua",
        "luacheck",
        -- web dev stuff
        "typescript-language-server",
        "mdx-analyzer",
        -- go
        "gopls",
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      servers = {

        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },

        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },

        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },

        lua_ls = {
          -- enabled = false,
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },

        -- rust_analyzer = {
        --   keys = {
        --     { "K", "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
        --     { "<leader>cR", "<cmd>RustCodeAction<cr>", desc = "Code Action (Rust)" },
        --     { "<leader>dr", "<cmd>RustDebuggables<cr>", desc = "Run Debuggables (Rust)" },
        --   },
        --   settings = {
        --     ["rust-analyzer"] = {
        --       cargo = {
        --         allFeatures = true,
        --         loadOutDirsFromCheck = true,
        --         runBuildScripts = true,
        --       },
        --       -- Add clippy lints for Rust.
        --       checkOnSave = {
        --         allFeatures = true,
        --         command = "clippy",
        --         extraArgs = { "--no-deps" },
        --       },
        --       procMacro = {
        --         enable = true,
        --         ignored = {
        --           ["async-trait"] = { "async_trait" },
        --           ["napi-derive"] = { "napi" },
        --           ["async-recursion"] = { "async_recursion" },
        --         },
        --       },
        --     },
        --   },
        -- },

        --   taplo = {
        --     keys = {
        --       {
        --         "K",
        --         function()
        --           if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
        --             require("crates").show_popup()
        --           else
        --             vim.lsp.buf.hover()
        --           end
        --         end,
        --         desc = "Show Crate Documentation",
        --       },
        --     },
        --   },
        --
        --   clangd = {
        --     keys = {
        --       { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        --     },
        --     root_dir = function(fname)
        --       return require("lspconfig.util").root_pattern(
        --         "Makefile",
        --         "configure.ac",
        --         "configure.in",
        --         "config.h.in",
        --         "meson.build",
        --         "meson_options.txt",
        --         "build.ninja"
        --       )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
        --         fname
        --       ) or require("lspconfig.util").find_git_ancestor(fname)
        --     end,
        --     capabilities = {
        --       offsetEncoding = { "utf-16" },
        --     },
        --     cmd = {
        --       "clangd",
        --       "--background-index",
        --       "--clang-tidy",
        --       "--header-insertion=iwyu",
        --       "--completion-style=detailed",
        --       "--function-arg-placeholders",
        --       "--fallback-style=llvm",
        --     },
        --     init_options = {
        --       usePlaceholders = true,
        --       completeUnimported = true,
        --       clangdFileStatus = true,
        --     },
        --   },
        -- },
      },
    },
  },
}
