-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  vim.o.guifont = "Iosevka:h14" -- text below applies for VimScript
  vim.g.neovide_cursor_vfx_mode = "railgun"
end