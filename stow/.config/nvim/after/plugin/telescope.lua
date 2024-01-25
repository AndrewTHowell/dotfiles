require('telescope').setup{
    pickers = { 
        find_files = {
            hidden = true,
            file_ignore_patterns = {".*.git/.*"}
        },
        grep_string= {
            additional_args = function(opts)
                return {
                    "--hidden",
                    "--glob", "!{**/.git/*}",
                }
            end
        }
    }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Project Find: find a file within the project" })
vim.keymap.set('n', '<leader>pgf', builtin.git_files, { desc = "Project Git Find: find a file within the git project"})
vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Project Search: search text within project files" })

