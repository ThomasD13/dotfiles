-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Set the blinking cursor settings
vim.o.guicursor = 'n-v:block,i:ver25,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250'

-- Make sure, that when we exit nvim the previous cursor settings get restored
vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:block20
    augroup END
]])

-- Adding relative line numbers
vim.opt.relativenumber = true

-- Fix the cursor in the middle of windows when scrolling
vim.opt.scrolloff = 6

-- Remap for dealing with word wrap in v mode (see init.lua:284)
vim.keymap.set('v', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true})
vim.keymap.set('v', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true})

return {
}
