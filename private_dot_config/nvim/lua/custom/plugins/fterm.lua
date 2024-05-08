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
    vim.keymap.set('n', '<A-r>l', '<C-\\><C-n><CMD>lua require("FTerm").run("top")<CR>', { desc = "Run FTerm lazygit"})
  end,
}

