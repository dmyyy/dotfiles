-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- TODO: disable C-c
-- vim.keymap.del({ "i", "v" }, "<C-c>")

-- Function to run flyCheck and then save for Rust files
-- function FlyCheckAndSave()
--   local filetype = vim.bo.filetype
--   if filetype == "rust" then
--     vim.cmd("RustLsp flyCheck")
--   end
--   vim.cmd("write")
-- end

-- Runs flycheck before saving for rust files
vim.keymap.set("n", "<C-s>", function()
  local filetype = vim.bo.filetype
  if filetype == "rust" then
    vim.cmd("RustLsp flyCheck")
  end
  vim.cmd("write")
end, { desc = "Fly Check and Save with Ctrl+S" })

-- Remap for opposite direction jumps to match j/k - k/]/} goes up, and j/[/{ goes down
vim.keymap.set({ "n", "v" }, "}", "{", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "{", "}", { noremap = true, silent = true })
-- lazy has custom keymaps for [/] behavior - remap each to match going up/down as expected
vim.keymap.set("n", "]b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "[b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "]q", vim.cmd.cprev, { desc = "Previous Quickfix" })
vim.keymap.set("n", "[q", vim.cmd.cnext, { desc = "Next Quickfix" })
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
vim.keymap.set("n", "[d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "]d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "[e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "]e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "[w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "]w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Duplicate a line and comment out the first line
vim.keymap.set("n", "yc", function()
  vim.api.nvim_feedkeys("yygccp", "m", false)
end)

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
vim.keymap.set("n", "<Leader>cp", "<cmd>lua vim.cmd('RustLsp openCargo')<CR>", { desc = "Open Cargo" })
