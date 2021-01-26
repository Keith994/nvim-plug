" ===
" === emmet-vim
" ===
let g:user_emmet_mode='iv'    "only enable insert mode functions.
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','
autocmd FileType html,css,vue EmmetInstall
