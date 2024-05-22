return {
  'numToStr/FTerm.nvim',
  config = function()
    require('FTerm').setup({
      -- just keep the standard settings for now
    })

    -- Toggle FTerm
    vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle FTerm"})
    vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle FTerm"})

    -- Run commands
    vim.keymap.set('n', '<A-r>l', '<C-\\><C-n><CMD>lua require("FTerm").run("lazygit")<CR>', { desc = "Run FTerm lazygit"})

    -- Scratch commands
    vim.keymap.set('n', '<A-r>bd', '<C-\\><C-n><CMD>lua require("FTerm").scratch({ cmd = "sh scripts/build.sh" })<CR>', { desc = "Scratch build.sh with default options"})
    vim.keymap.set('n', '<A-r>bc', '<C-\\><C-n><CMD>lua require("FTerm").scratch({ cmd = "sh scripts/build.sh -cb" })<CR>', { desc = "Scratch build.sh with clean build option"})
    vim.keymap.set('n', '<A-r>bf', '<C-\\><C-n><CMD>lua require("FTerm").scratch({ cmd = "sh scripts/build.sh -fb" })<CR>', { desc = "Scratch build.sh with fresh option"})
    vim.keymap.set('n', '<A-r>bn', '<C-\\><C-n><CMD>lua require("FTerm").scratch({ cmd = "sh scripts/build.sh -nb" })<CR>', { desc = "Scratch build.sh with no build option"})
    
    vim.keymap.set('n', '<A-r>cf', '<C-\\><C-n><CMD>lua require("FTerm").scratch({ cmd = "sh scripts/checkformat.sh" })<CR>', { desc = "Scratch checkformat readonly"})
    vim.keymap.set('n', '<A-r>ca', '<C-\\><C-n><CMD>lua require("FTerm").scratch({ cmd = "sh scripts/checkanalyzer.sh" })<CR>', { desc = "Scratch checkanalyzer"})
  end,
}

