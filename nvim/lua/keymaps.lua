-- Save & Quit
--vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
--vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit window" })

-- Window navigation with Ctrl + hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })


-- Insert blank line below (stay in Normal mode)
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Add blank line below" })

-- Insert blank line above (stay in Normal mode)
--vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Add blank line above" })

