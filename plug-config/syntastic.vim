" ===
" === syntastic.vim
" ===

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cs_checkers = ['code_checker']
let g:syntastic_error_symbol = "\u2717"
let g:syntastic_style_error_symbol="\u2717"
let g:syntastic_warning_symbol = ""
let g:syntastic_style_warning_symbol = ""
let g:syntastic_auto_jump = 3
highlight SyntasticErrorLine guibg=#5e5555
highlight SyntasticWarningSign guibg=transparent guifg=yellow
