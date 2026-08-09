require("smear_cursor").toggle()
require("yazi").setup({
  open_for_directories = false,
  keymaps = {
    open = "<leader>-",
    hide = "<C-y>",
  },
})
require("nvim-tree").setup()
