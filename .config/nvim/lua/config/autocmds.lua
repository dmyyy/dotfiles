-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- wgsl analyzer
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})

-- disable C-l when in neovim terminal (used to clear terminal)
vim.api.nvim_create_autocmd("TermEnter", {
  callback = function(ev)
    vim.keymap.set("t", "<c-l>", "<c-l>", { buffer = ev.buf, nowait = true })
  end,
})
