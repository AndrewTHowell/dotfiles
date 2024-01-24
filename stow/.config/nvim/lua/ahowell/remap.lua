vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "Project View: view the current directory"})

-- Highlighted text can be moved up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move the highlighted text down a line"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move the highlighted text up a line"})

vim.keymap.set("n", "J", "mzJ`z", {desc = "Append the next line to the current one with a space, keeping the cursor where it is"})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Mod - keeps cursor centred when paging down"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Mod - keeps cursor centred when paging up"})
vim.keymap.set("n", "n", "nzzzv", {desc = "Mod - keeps cursor centred when searching next match"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Mod - keeps cursor centred when searching previous match"})

--[[
-- Not sure what these do tbh, theprimeagen uses them for 'Twitch'
vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)
]]--

vim.keymap.set("x", "<leader>p", "\"_dP", {desc = "Pastes text A over text B, preserving A for future pastes"})
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", {desc = "Deletes text B with text A copied, preserving A for future pastes"})

vim.keymap.set({"n", "v"}, "<leader>y", "\"+y", {desc = "Sends next selection to clipboard"})
vim.keymap.set("n", "<leader>Y", "\"+Y", {desc = "Sends next selection to clipboard"})

vim.keymap.set("n", "Q", "<nop>", {desc = "Mod - stops accidentally entering Ex mode"})
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Shortcut to substitute current word globally"})
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, {desc = "Source file"})

