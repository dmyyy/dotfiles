-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 20

-- disable autopairs
vim.g.minipairs_disable = true

LazyVim.terminal.setup("fish")

-- treat _ as a delimiter for words
vim.opt.iskeyword:remove("_")

-- TODO: this doesn't work
-- OBSIDIAN_WORKSPACES = {
--   ["home/dmy/obsidian-git-sync"] = true,
-- }
--
-- -- Run ObsidianToday command if in obsidian workspace
-- vim.api.nvim_create_autocmd("VimEnter", {
--   -- group = vim.api.nvim_create_augroup("obsidian_today", { clear = true }),
--   callback = function()
--     print("tests")
--
--     vim.schedule(function()
--       local current_dir = vim.fn.getcwd()
--
--       if OBSIDIAN_WORKSPACES[current_dir] then
--         print("obsidian executed")
--         vim.cmd("ObsidianToday")
--       else
--         print("Not executed")
--       end
--     end)
--   end,
-- })
