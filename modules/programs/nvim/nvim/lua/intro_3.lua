-- Define the startup screen logic inside the autocmd callback
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    -- Only proceed if:
    -- 1. No files were passed as arguments
    -- 2. The current buffer is empty (no file loaded)
    -- 3. We're not in insert mode
    if vim.fn.argc() > 0 or vim.fn.line2byte("$") ~= -1 or vim.o.insertmode then
      return
    end

    -- Create a new unnamed buffer for the splash screen
    vim.cmd("enew")

    -- Configure buffer options for a clean splash screen
    vim.bo.bufhidden = "wipe"
    vim.bo.buftype = "nofile"
    vim.bo.buflisted = false
    vim.bo.swapfile = false
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.cursorline = false
    vim.wo.cursorcolumn = false
    vim.wo.list = false

    -- Render custom content (ensure 'milli' is loaded first)
    local ok, milli = pcall(require, "milli")
    if ok then
      milli.vimenter({ splash = "garchomp", loop = true })
    else
      -- Fallback text if plugin fails to load
      vim.api.nvim_buf_set_lines(0, 0, -1, false, {
        "Welcome to Neovim!",
        "",
        "Press 'e' to create a new file",
        "Press 'q' to quit",
      })
    end

    -- Make buffer read-only
    vim.bo.modifiable = false
    vim.bo.modified = false

    -- Set keymaps for navigation
    vim.keymap.set("n", "q", ":qa<CR>", { buffer = 0, silent = true, noremap = true })
    vim.keymap.set("n", "e", ":enew<CR>", { buffer = 0, silent = true, noremap = true })
    vim.keymap.set("n", "o", ":enew<CR>i", { buffer = 0, silent = true, noremap = true })
  end,
})   
