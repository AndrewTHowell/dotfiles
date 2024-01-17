local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- project find
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- git find
vim.keymap.set('n', '<leader>ps', function()  -- project search
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

