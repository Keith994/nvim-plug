" ===
" === OmniSharp
" ===

let g:OmniSharp_typeLookupInPreview = 1
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_server_path='/usr/local/bin/omnisharp-roslyn/v1.37.6/omnisharp/OmniSharp.exe'
let g:OmniSharp_loglevel = 'warning'
"
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_selector_ui = 'FZF'
let g:OmniSharp_popup_position = 'atcursor'
let g:OmniSharp_popup_mappings = {
			\ 'sigNext': '<C-n>',
			\ 'sigPrev': '<C-p>',
			\ 'pageDown': ['<C-f>', '<PageDown>'],
			\ 'pageUp': ['<C-b>', '<PageUp>']
			\}
let g:OmniSharp_highlight_groups = {
			\ 'ExcludedCode': 'NonText'
			\}
let g:OmniSharp_popup_options = {
\ 'winblend': 30,
\ 'winhl': 'Normal:floating',
\}
let g:OmniSharp_diagnostic_exclude_paths = [
\ 'bin\\',
\ '\.git\\',
\ 'obj\\',
\ '[Tt]emp\\',
\ '\.nuget\\',
\ '\<AssemblyInfo\.cs\>'
\]
" IDE0010: Populate switch - display in ALE as `Info`
" IDE0055: Fix formatting - display in ALE as `Warning` style error
" CS8019: Duplicate of IDE0005
" RemoveUnnecessaryImportsFixable: Generic warning that an unused using exists
let g:OmniSharp_diagnostic_overrides = {
\ 'IDE0010': {'type': 'I'},
\ 'IDE0055': {'type': 'W', 'subtype': 'Style'},
\ 'CS8019': {'type': 'None'},
\ 'CS8632': {'type': 'None'},
\ 'RemoveUnnecessaryImportsFixable': {'type': 'None'}
\}
"
function s:Redir() abort
	redi @u>
	:silent !dotnet build
	redi END
	return @u
endfunction

function BuildNetCore()
	let l:meeg = s:Redir()
	if -1 != stridx(l:meeg, "error MSB1003") || -1 != stridx(l:meeg, "生成失败")
		:silent lopen
		echo l:meeg
		return
	endif
  call vimspector#Continue()
endfunction

augroup omnisharp_commands
	autocmd!
	autocmd Filetype cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
	autocmd Filetype cs nnoremap <buffer> gD :OmniSharpPreviewDefinition<CR>
	autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
	autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
	autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
	autocmd Filetype cs nnoremap <buffer> gR :OmniSharpRename<CR><C-N>:res +5<CR>
	autocmd Filetype cs nnoremap <buffer> <localleader>r :OmniSharpRestartServer<CR>
	autocmd Filetype cs nnoremap <buffer> T :Vista<CR>

	" Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)

	autocmd FileType cs nmap <silent> <buffer> <leader>fa :SharpenUpAddToProject<CR>
	autocmd FileType cs nmap <silent> <buffer> <localleader>f :OmniSharpCodeFormat<CR>
	autocmd FileType cs nmap <silent> <buffer> <F5> :<C-U>call BuildNetCore()<CR>
augroup END
"
sign define OmniSharpCodeActions text=💡
"
augroup OSCountCodeActions
	autocmd!
	autocmd CursorHold *.cs call OSCountCodeActions()
augroup END
"
function! OSCountCodeActions() abort
	if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
	if !OmniSharp#IsServerRunning() | return | endif
	let opts = {
				\ 'CallbackCount': function('s:CBReturnCount'),
				\ 'CallbackCleanup': {-> execute('sign unplace 99')}
				\}
	call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
	if a:count
		let l = getpos('.')[1]
		let f = expand('%:p')
		execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
	endif
endfunction

augroup lightline_integration
  autocmd!
  autocmd User OmniSharpStarted,OmniSharpReady,OmniSharpStopped call lightline#update()
augroup END

