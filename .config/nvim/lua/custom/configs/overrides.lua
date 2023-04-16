local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "fish",
    "json",
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "rust",
    "dockerfile",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "yaml-language-server",
    "bash-language-server",

    -- devopsy stuff
    "dockerfile-language-server",
    "docker-compose-language-service",
    "terraform-ls",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "deno",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "vue-language-server",
    "prettier",

    -- rust stuff
    "rust-analyzer",
    "rustfmt",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

-- Blankline
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#EA6C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5A07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#88E369 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#46A6B2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#518FFF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#E678ED gui=nocombine]]

M.blankline = {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}

return M
