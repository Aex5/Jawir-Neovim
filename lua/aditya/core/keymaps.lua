vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- tab management
keymap.set("n", "<Tab>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- next tab
keymap.set("n", "<S-Tab>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- previous tab
keymap.set("n", "<S-x>", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

vim.api.nvim_create_user_command('TabSelect', function()
    local tabs = {}
    for i = 1, vim.fn.tabpagenr('$') do
        local buf = vim.fn.bufname(vim.fn.tabpagebuflist(i)[1])
        table.insert(tabs, string.format('%d: %s', i, buf))
    end
    local choice = vim.fn.inputlist(tabs)
    if choice > 0 then
        vim.cmd('tabnext ' .. choice)
    end
end, {})

vim.keymap.set("n", "<leader>tl", ":TabSelect<CR>", { desc = "Select a tab to jump to" })

-- change command mode to use ;
keymap.set("n", ";", ":", { noremap = true, silent = false, desc = "Enter command mode with ;" })
vim.keymap.set('n', '<leader>cc', ':e $MYVIMRC<cr>');
