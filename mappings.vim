"  _  __    _ _   _       _   ___     _____ __  __ ____   ____ 
" | |/ /___(_) |_| |__   | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" | ' // _ \ | __| '_ \  |  \| |\ \ / / | || |\/| | |_) | |    
" | . \  __/ | |_| | | | | |\  | \ V /  | || |  | |  _ <| |___ 
" |_|\_\___|_|\__|_| |_| |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"
                                                             
" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let g:mapleader="\<Space>"
let g:maplocalleader=','
noremap ; :
inoremap jk <ESC>

" Press ` to change case (instead of ~)
noremap ` ~

" Save & quit
noremap <C-q> :qa<CR>
noremap <silent> <LocalLeader>w :w<CR>
noremap <silent> <LocalLeader>c :Calendar -position=here<CR>
noremap <silent> <LocalLeader>\ :Calendar -view=clock -position=here<CR>

" Make Y to copy till the end of the line
nnoremap Y "+y$

" Copy to system clipboard
vnoremap Y "+y

" K/J keys for 5 times K/J (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

" H key: go to the start of the line
noremap <silent> H 0

" L key: go to the end of the line
noremap <silent> L $

" Move 5 words at a time，faster in-line navigation
noremap W 5w
noremap B 5b

" Indentation
nnoremap < <<
nnoremap > >>

" ===
" === Insert Mode Cursor Movement, emacs style 
" ===
inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
inoremap <C-f> <ESC>la
inoremap <C-b> <ESC>i
inoremap <C-p> <ESC>ki
inoremap <C-n> <ESC>ji

" Call figlet
noremap tx :r !figlet 

" ===
" === Command Mode Cursor Movement, Emacs Style
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

" Space to Tab
nnoremap <LocalLeader>tt :%s/    /\t/g
vnoremap <localleader>tt :s/    /\t/g

" Folding
"noremap <silent> <LEADER>o za

" 显示当前路径
noremap \p i<c-r>=expand('%:p')<CR> <ESC>

" term 设置
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
noremap <silent> <leader>/ :OpenTerminal<CR>
tnoremap <C-g> <C-\><C-N>
"tnoremap <C-O> <C-\><C-N><C-O>

" Open up lazygit
" fugitive
noremap <silent> <leader>gg :Git<CR> 
noremap <silent> <leader>gl :tabe<CR>:-tabmove<CR>:term lazygit<CR>
" preview hunk 
noremap <silent> gp :GitGutterPreviewHunk<CR>

" 移动视窗的位置，不改变光标位置
noremap <C-y> 3<C-y> 
noremap <C-e> 3<C-e>

" ===
" === Buffer 缓冲相关
" ===
" BD函数定义
noremap <silent> <leader>bd :bd<CR>
noremap <silent> <leader>bk :BD<CR>
noremap <silent> <leader>bb :Buffers<CR>
noremap <silent> <leader>bp :bprevious<CR>
noremap <silent> <leader>bn :bnext<CR>
noremap <silent> <leader>bf :bfirst<CR>
noremap <silent> <leader>bl :blast<CR>
noremap <silent> <leader>bN :new<CR>

function! s:list_buffers()
	redir => list
	silent ls
	redir END
	return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
	execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
			\ 'source': s:list_buffers(),
			\ 'sink*': { lines -> s:delete_buffers(lines) },
			\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
			\ }))
" end BD

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
" Press <SPACE> + q to close the current window
noremap <LEADER>q :q<CR>
" 左右分割
noremap <LEADER>ws <C-W>s
" 上下分割
noremap <LEADER>wv <C-W>v
noremap <Leader>= <C-W>=
noremap <leader>K :res +5<CR>
noremap <leader>J :res -5<CR>
noremap <leader>H :vertical resize-5<CR>
noremap <leader>L :vertical resize+5<CR>

" <leader>0-<leader>9 switch window
function s:MapWK()
	execute 'noremap <leader>0 :10wincmd w<CR>'
	for i in range(1,9)
		execute 'noremap <leader>'.i.' :'.i.'wincmd w<CR>'
	endfor
endfunction
call s:MapWK()

" ===
" === search 相关
" ===
noremap <silent> <leader>sj :AnyJump<CR>
noremap <leader><leader> :<c-u>FzfPreviewDirectoryFilesRpc<CR> 
noremap <silent> <leader>sf :<c-u>FzfPreviewDirectoryFilesRpc<CR> 
noremap <silent> <leader>sF :Files<CR>
noremap <silent> <leader>sd :Ag<CR>
noremap <silent> <leader>sp :Rg<CR>
noremap <silent> <leader>ss :FzfPreviewLinesRpc<CR>
noremap <silent> <leader>sh :FzfPreviewMrwFilesRpc<CR>
noremap <silent> <leader>sc :FzfPreviewCommandPaletteRpc<CR>
noremap <silent> <leader>sgl :FzfPreviewGitLogsRpc<CR>
noremap <silent> <leader>sgb :FzfPreviewGitBranchesRpc<CR>
noremap <silent> <leader>sgf :FzfPreviewGitFilesRpc<CR>


" 打开变量列表
noremap <silent> T :Vista coc<CR>
noremap <leader>st :silent! Vista finder coc<CR>

" ===
" === coc-explorer
" === 打开一个左侧栏文件树
" ===
nmap tt :CocCommand explorer<CR>

" ===
" === coc-translator
" ===
nmap ts <Plug>(coc-translator-p)

" ===
" === 标签页管理
" ===
noremap tn :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>


" ===
" === Undotree
" ===
" 列出undo的树型结构
noremap <leader>u :UndotreeToggle<CR>
function g:Undotree_CustomMap()
	nmap <buffer> k <plug>UndotreeNextState
	nmap <buffer> j <plug>UndotreePreviousState
	nmap <buffer> K 5<plug>UndotreeNextState
	nmap <buffer> J 5<plug>UndotreePreviousState
endfunc

" ===
" === vim-visual-multi
" ===
" let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'H': '0', 'L': '$'}
let g:VM_maps['i']                  = 'i'
let g:VM_maps['I']                  = 'I'
let g:VM_maps['Find Under']         = '<C-j>'
let g:VM_maps['Find Subword Under'] = '<C-j>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
"let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'

" ===
" === vim-easymotion
" === 快速移动到字符所在位置，两个字符
nmap s <Plug>(easymotion-overwin-f2)

" ===
" === wildfire
" === 在可视化模式时，在引号等中选择内容
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

" ===
" === vim-after-object
" ===
" va= visual after =
" ca= change after =
" da= delete after =
" ya= yank after   =
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" ===
" === tabular
" ===
" 支持regex
vmap ga :Tabularize /

" ===
" === suda.vim
" ===
" 添加sudo操作
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%

" ===
" === rnvimr
" ===
let g:rnvimr_action = {
			\ 'T': 'NvimEdit tabedit',
			\ 'S': 'NvimEdit split',
			\ 'V': 'NvimEdit vsplit',
			\ 'gw': 'JumpNvimCwd',
			\ 'yw': 'EmitRangerCwd'
			\ }

" ===
" === tcomment_vim
" ===
let g:tcomment_maps=0
" 注释
" nmap <LEADER>cn g>c
" vmap <LEADER>cn g>
" " 取消注释
" nmap <LEADER>cu g<c
" vmap <LEADER>cu g<

" ===
" === Coc-shortcut
" ===

" Text Objects
" 函数内部选择
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" 在类的范围操作
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)      " 去到所在定义
nmap <silent> gD <Plug>(coc-type-definition) " 去到变量的所在类型定义
nmap <silent> gi <Plug>(coc-implementation)  " 去到所在实现
nmap <silent> gr <Plug>(coc-references)      " 引用
nmap <silent> gR <Plug>(coc-rename)          " 重命名变量
"nmap <leader>rn <Plug>(coc-rename)           " 重命名变量

" coctodolist
"" CocTodoList创建
nnoremap <leader>tn :CocCommand todolist.create<CR>
" 显示查找TodoList
nnoremap <leader>ts :CocList todolist<CR>
" 更新TodoList
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR> 
" coc-tasks
noremap <silent> <leader>tt :CocList tasks<CR>                                       " Task显示查找

nnoremap <c-c> :CocCommand<CR>                     " Coc的所有命令
"nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
"nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
"nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
	execute 'CocCommand actions.open ' . a:type
endfunction
" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" coc-snippets
" Snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-n>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-p>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" press f10 to show hlgroup
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" ===
" === flutter setting
" ===
let g:flutter_default_device = 'emulator-5554'


" Compile function
noremap <LEADER>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

source ~/.config/nvim/which-key.vim

" ===
" === any-jump
" === 符号跳转
"nnoremap <leader>sj :AnyJump<CR>
" Visual mode: jump to selected text in visual mode
"xnoremap <leader>sj :AnyJumpVisual<CR>

" ===
" === vim-table-mode
" ===
" === 表格制作，使用| - + ，按两次|可以自动完成一行
" === 只在text文件，md文件，vim-plug文件生效
"noremap <Leader>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
