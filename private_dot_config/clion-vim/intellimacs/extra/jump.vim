" Jump to class
let g:WhichKeyDesc_JumpJoinSplit_JumpToClass = "<leader>jc search-class"
nnoremap <leader>sc   :action GotoClass<CR>
vnoremap <leader>sc   :action GotoClass<CR>

" Jump to element in current file
let g:WhichKeyDesc_JumpJoinSplit_JumpToFileStructure = "<leader>je jump-to-file-structure"
nnoremap <leader>je   :action FileStructurePopup<CR>
vnoremap <leader>je   :action FileStructurePopup<CR>

" Jump to symbol
let g:WhichKeyDesc_JumpJoinSplit_JumpToSymbol = "<leader>ss search-symbol"
nnoremap <leader>ss    :action GotoSymbol<CR>
vnoremap <leader>ss    :action GotoSymbol<CR>
