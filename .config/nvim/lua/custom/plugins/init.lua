-- Blankline
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#EA6C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5A07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#88E369 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#46A6B2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#518FFF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#E678ED gui=nocombine]]

return {
  ["hashivim/vim-terraform"] = {},
  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = {
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
  },
}
