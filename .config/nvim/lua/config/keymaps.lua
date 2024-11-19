-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- TODO: disable C-c
-- vim.keymap.del({ "i", "v" }, "<C-c>")

-- vim.keymap.set({ "n", "v" }, "<leader>xx", vim.lsp.buf.references, { buffer = true })
--
-- Nvim DAP
vim.keymap.set("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
vim.keymap.set("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
vim.keymap.set("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
vim.keymap.set("n", "<Leader>dc>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
vim.keymap.set(
  "n",
  "<Leader>db",
  "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
  { desc = "Debugger toggle breakpoint" }
)
vim.keymap.set(
  "n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
vim.keymap.set("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
vim.keymap.set("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
vim.keymap.set("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })
vim.keymap.set("n", "<Leader>di", "<cmd>lua vim.cmd('RustLsp debug')<CR>", { desc = "Debug" })
vim.keymap.set("n", "<Leader>ck", "<cmd>lua vim.cmd('RustLsp flyCheck')<CR>", { desc = "Fly ChecK" })
vim.keymap.set("n", "<Leader>cp", "<cmd>lua vim.cmd('RustLsp openCargo')<CR>", { desc = "Open Cargo" })
