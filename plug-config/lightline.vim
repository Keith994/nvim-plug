" ===
" === lightline
" ===
let g:lightline = {
			\ 'colorscheme': 'oceanicnext',
			\ 'active' : {
				\ 'left' : [[ 'winnr'],[ 'mode', 'paste' ],
								\ ['readonly', 'filename', 'modified'], ['gitbranch'], ['gitstatus' ],['method' ]],
								\ 'right': [ [ 'fsize'],['lineinfo'], ['CocStatus', 'filetype' ]],
			\ },
			\ 'inactive' : {
				\ 'left': [ ['winnr'], ['filename'] ],
				\ 'right': [ [ 'lineinfo', 'percent' ] ]
				\},
			\ 'component': {
				\   'lineinfo': ' %l/%L:%c',
				\ },
			\ 'component_function': {
				\ 'readonly': 'LightlineReadonly',
				\ 'gitstatus': 'LightlineGitStatus',
				\ 'gitbranch':  'LightGitBranch',
				\ 'fsize': 'LightlineFsize',
			  \ 'method': 'NearestMethodOrFunction',
				\ 'CocStatus': 'CocStatus_k',
				\ },
			\ }

function! GoNearestMethod() abort
	if !exists('b:vista_nearest_method_or_function')
		return
	endif
	m'
	let tmp = '?'. b:vista_nearest_method_or_function.'('
	execute tmp
	call search('{')
endfunction
command! GoNearestMethodC call GoNearestMethod()

function! NearestMethodOrFunction() abort
	if exists('b:vista_nearest_method_or_function')
		if strlen(b:vista_nearest_method_or_function) <= 1
		 	return ''
		endif
		return "\uf794:" . b:vista_nearest_method_or_function 
	else
		return  ''
	endif
endfunction

function! CocStatus_k() abort
	let l:st = coc#status()
	if strlen(l:st) <= 0
		return ''
	else
		return ' ' . l:st
	endif
endfunction

function! LightGitBranch() abort
	let l:head = call('FugitiveHead', []) 
	if len(l:head) > 0
		return '  ' . l:head
	else
		return ''
	endif
endfunction

function! LightlineReadonly()
	return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function LightlineGitStatus() abort
	let l:summary = [0, 0, 0]
	if exists('b:sy') && exists('b:sy.b:sy.stats')
		let l:summary = b:sy.stats
	elseif exists('b:gitgutter') && exists('b:gitgutter.summary')
		let l:summary = b:gitgutter.summary
	else
		return ''
	endif
	if max(l:summary) > 0
		return '+'.l:summary[0].' ~'.l:summary[1].' -'.l:summary[2].' '
	endif
	return ''
endfunction

function! LightlineFsize() abort
	let l:size = getfsize(expand(@%))
	if l:size == 0 || l:size == -1 || l:size == -2
		return ''
	endif
	if l:size < 1024
		let size = l:size.' B'
	elseif l:size < 1024*1024
		let size = printf('%.1f', l:size/1024.0).'K'
	elseif l:size < 1024*1024*1024
		let size = printf('%.1f', l:size/1024.0/1024.0) . 'M'
	else
		let size = printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'G'
	endif
	return size
endfunction
" End LightLine
