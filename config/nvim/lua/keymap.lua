vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>we", ":Ex<CR>")

vim.keymap.set("n", "<leader>k", "<C-o>", { desc = "Move cursor back to previous position" })
vim.keymap.set("n", "<leader>j", "<C-i>", { desc = "Move cursor back to forward position" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Eslint
vim.keymap.set("n", "<leader>fa", function()
	vim.cmd("EslintFixAll")
end, { desc = "fix all eslint problems" })

-- vim.keymap.set("n", "<leader>fi", function()
-- 	require("typescript-tools.api").remove_unused_imports(true)
-- end, { desc = "fix unused imports" })
--
vim.keymap.set("n", "<leader>cre", function()
	vim.cmd("LspLensOn")
end)

vim.keymap.set("n", "<leader>crd", function()
	vim.cmd("LspLensOff")
end)
