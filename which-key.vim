
" ===
" === which_key Leader键开头的
" ===
call which_key#register('<Space>', "g:which_key_map")
call which_key#register(',', "g:which_key_local_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>

" Create map to add keys to
let g:which_key_map                      = {}
let g:which_key_local_map                = {}

" Not a fan of floating windows for this
let g:which_key_use_floating_win         = 0
let g:which_key_max_size                 = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
			\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


" no highlight search
noremap <silent> <LEADER><CR> :nohlsearch<CR>

" Single mappings
let g:which_key_map['<CR>']    = 'no-highlight'
let g:which_key_map['/']       = 'open-terminal'
let g:which_key_map['r']       = 'run-current-file'
let g:which_key_map['u']       = 'undo-tree'
let g:which_key_map['=']       = 'balance-windows'
let g:which_key_map['y']       = 'yank-from-history'
let g:which_key_map['<space>'] = 'current-directory'

function s:ignore_window_switch()
	for i in range(0,9)
		execute "let g:which_key_map.".i."='which_key_ignore'"
	endfor
	let l:wlist = ['q', 'j', 'k', 'l', 'h', 'J', 'K', 'L', 'H']
	for i in l:wlist
		execute "let g:which_key_map.".i."='which_key_ignore'"
	endfor
endfunction
call s:ignore_window_switch()

" Single local key mappings
let g:which_key_local_map['w'] = 'write-Buffer'
let g:which_key_local_map['c'] = 'calender'
let g:which_key_local_map['\'] = 'Clock'

" ===
" === Code linter
" ===

nmap <silent> <leader>cp <Plug>(ale_previous_wrap)
nmap <silent> <leader>cn <Plug>(ale_next_wrap)
nmap <slient> <leader>cf :AutoFromat<cr>
nmap <silent> <leader>co :lopen<cr>
let g:which_key_map['c'] = {
			\ 'name': '+code',
			\ 'p': 'ale-previous-wrap',
			\ 'n': 'ale-next-wrap',
			\ 'f': 'format',
			\ 'o': 'errors-list',
			\}

" ===
" === Actions 相关
" ===

function! s:show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <leader>dh :call <SID>show_documentation()<CR>

"show help document
let g:which_key_map.d = {
			\ 'name' : '+document'  ,
			\ 'h'    : 'show-helps' ,
			\}

" ===
" === Git 相关
" ===
nnoremap <leader>gi :<c-u>CocList gitignore<cr>
let g:which_key_map.g = {
			\ 'name' : '+git',
			\ 'i'    : 'create-ignore-file-using-template',
			\ 'L'    : ['Agit'                 , 'agit-log-tool']                     ,
			\ 'h'    : ['GitGutterNextHunk'    , 'git-next-hunk']                     ,
			\ 'H'    : ['GitGutterPrevHunk'    , 'git-previous-hunk']                 ,
			\ 'p'    : ['GitGutterPreviewHunk' , 'git-hunk-preview']                  ,
			\ 'f'    : ['GitGutterFold'        , 'git-toggle-fold']                   ,
			\ 'g'    : 'fugitive'              ,
			\ 'l'    : 'layzygit'
			\}

" ===
" === Coc TodoList
" ===
let g:which_key_map.t = {
			\ 'name' : '+todo-list' ,
			\ 'n'    : 'new'       ,
			\ 's'    : 'search'    ,
			\ 'u'    : 'update'    ,
			\ 't'    : 'coc-tasks' ,
			\}

" ===
" === windows 相关
" ===
let g:which_key_map['w'] = {
			\ 'name'   : '+windows' ,
			\ 's'      : ['<C-W>s'  , 'split-window-below']               ,
			\ 'v'      : ['<C-W>v'  , 'split-window-right']               ,
			\ 'w'      : 'move-window'                                    ,
			\ '?'      : ['Windows' , 'fzf-window']                       ,
			\ }

" ===
" === file 相关
" ===

function! s:file_path()
	redi @">
	echo(expand('%:p'))
	redi END
endfunction
command! FilePath call <SID>file_path()

function! s:nvim_path()
	:Files $HOME/.config/nvim
endfunction
command! NvimPath call <SID>nvim_path()

let g:which_key_map.f = {
			\ 'name' : '+file'     ,
			\ 'f'    : ["Files"    , 'search file'    ] ,
			\ 'y'    : ["FilePath" , 'yank file path' ] ,
			\ 'p'    : ['NvimPath' , 'edit nvim file' ] ,
			\}

" ===
" === open 打开相关
" ===
function s:open_termianl_bellow()
	silent set splitbelow
	silent split
	silent res -4
	silent term
endfunction
command! OpenTerminall call <SID>open_termianl_bellow()

function Open_Explorer()
	CocCommand explorer
endfunction
command! OpenExplorer call Open_Explorer()

function Open_LazyGit()
	silent tabe
	silent -tabmove
	silent term lazygit
endfunction
command! OpenLazyGit call Open_LazyGit()

nnoremap <leader>ocl :<c-u>CocList<cr>
nnoremap <leader>ocs :<c-u>CocList snippets<cr>
nnoremap <leader>oce :<c-u>CocList extensions<cr>
nnoremap <leader>ocm :<c-u>CocList marketplace<cr>
nnoremap <leader>ock :<c-u>CocList maps<cr>
nnoremap <leader>oct :<c-u>CocList tasks<cr>
let g:which_key_map.o = {
			\ 'name' : '+open'         ,
			\ 't'    : ['OpenTerminal' , 'open-term'         ] ,
			\ 'p'    : ['OpenExplorer' , 'open-file-sidebar' ] ,
			\ 'l'    : ['OpenLazyGit'  , 'open-lazygit'      ] ,
			\ 'c'    : {
			\'name': '+CocList',
			\ 'l' : 'OpenCocList',
			\ 's' : 'snippets',
			\ 'e' : 'extentions',
			\ 'm' : 'marketplace',
			\ 'k' : 'key-mappings',
			\ 't' : 'tasks',
			\}
			\}

" ===
" === Buffer 缓冲相关
" ===
let g:which_key_map.b = {
			\ 'name' : '+buffer'               ,
			\ 'N'    : 'new buffer'            ,
			\ 'd'    : 'delete-current-buffer' ,
			\ 'k'    : 'delete which buffer'   ,
			\ 'b'    : 'switch buffer'         ,
			\ 'p'    : 'previous buffer'       ,
			\ 'n'    : 'next buffer'           ,
			\ 'f'    : 'first buffer'          ,
			\ 'l'    : 'last buffer'           ,
			\}

" ===
" === 搜索相关
" ===
function Hist_Cmd()
	History:
endfunction
command! HistCmd call Hist_Cmd()
let g:which_key_map.s = {
			\ 'name'    : '+fzf-search'       ,
			\ 't'       : 'tags'              ,
			\ 'j'       : 'AnyJump'           ,
			\ 'f'       : 'files'             ,
			\ 'd'       : 'current-directory' ,
			\ 'p'       : 'project'           ,
			\ 'h'       : 'history file'      ,
			\ 's'       : 'current buffer'    ,
			\ 'c'       : 'history command'   ,
			\ 'g'       : {
			\'name' : '+search-git'       ,
			\'l'    : 'log'               ,
			\'b'    : 'branch'            ,
			\'f'    : 'git-files'         ,
			\}
			\}

