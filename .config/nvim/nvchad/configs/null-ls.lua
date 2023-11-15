local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" } }, -- so prettier works only on these filetypes
  b.formatting.eslint_d,
  b.diagnostics.eslint_d,
  b.code_actions.eslint_d,

  -- rust
  b.formatting.rustfmt,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
