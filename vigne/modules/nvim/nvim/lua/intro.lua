-- Create a custom start screen
if vim.fn.argc() == 0 then
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      -- Open a new buffer and set it as unlisted and wiped out when hidden
      vim.cmd("enew")
      vim.cmd("setlocal bufhidden=wipe buftype=nofile nobuflisted nonumber norelativenumber")
      -- Write custom content
      require("milli").starter({ splash = "fire", loop = true })
      -- Make buffer non-modifiable
      vim.cmd("setlocal nomodifiable")
      -- Map 'q' to quit and 'e' to new file
      vim.api.nvim_buf_set_keymap(0, "n", "q", ":qa<CR>", { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, "n", "e", ":enew<CR>", { noremap = true, silent = true })
    end
  })
end
