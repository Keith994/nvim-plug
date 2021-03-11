" ===
" === fzf-preview
" ===
let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_command = 'bat --color=always --plain {-1}'
let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap' }
" Commands used to get the file list from current directory
let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages --glob "!.git/*" --glob \!"* *"'
" fzf window position settings
let g:fzf_preview_direct_window_option ='' 
" floating window size ratio
let g:fzf_preview_floating_window_rate = 0.8
" Limit of the number of files to be saved by mru
let g:fzf_preview_mru_limit = 100
"let g:fzf_preview_fzf_preview_window_option = 'down:30%'
