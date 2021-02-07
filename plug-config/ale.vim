" ===
" === ale.vim
" ===
"
let g:ale_linters_explicit = 0
let g:ale_disable_lsp = 1
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] [%severity%] => %s'
" let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1
let g:ale_sign_error = "\uf467"
let g:ale_sign_warning = "\uf071"
let g:ale_linters ={
\ 'cs': ['OmniSharp'],
\ 'javascript': ['eslint']
\}
highlight ALEWarningSign guibg=transparent guifg=yellow

