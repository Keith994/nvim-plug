" ==
" == GitGutter
" ==
let g:gitgutter_enabled = 1
"let g:gitgutter_highlight_lines = 1
"let g:gitgutter_highlight_linenrs = 1 " 行高亮
let g:gitgutter_signs = 1
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_preview_win_floating = 1
" let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
" let g:gitgutter_sign_removed =  '-'
" let g:gitgutter_sign_removed_first_line = '▔'
" let g:gitgutter_sign_modified_removed = '▒'
autocmd BufWritePost * GitGutter
" nnoremap <LEADER>gf :GitGutterFold<CR>
" nnoremap H :GitGutterPreviewHunk<CR>
" nnoremap <LEaDER>g- :GitGutterPrevHunk<CR>
" nnoremap <LEADER>g= :GitGutterNextHunk<CR>
