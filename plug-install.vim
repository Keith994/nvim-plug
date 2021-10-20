" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" 二进制编辑
Plug 'rootkiter/vim-hexedit'
" 主题插件
Plug 'hardcoreplayers/oceanic-material'
" Status line
Plug 'itchyny/lightline.vim'
" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' } " 颜色显示
Plug 'RRethy/vim-illuminate' "自动突出显示光标下当前单词的其他用法
" File navigation
Plug 'junegunn/fzf.vim', {'do': {-> fzf#install()}} " 模糊搜索
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }
" Ranger
Plug 'kevinhwang91/rnvimr'
" 打开文件或目录时，Rooter会将工作目录更改为项目根目录。
Plug 'airblade/vim-rooter'  
" 光标下的变量自动跳转
Plug 'pechorin/any-jump.vim' 
" Taglist
Plug 'liuchengxu/vista.vim'
" Debugger
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}  " Vim的多语言图形调试器
" Syntax Checker
Plug 'dense-analysis/ale'
" Syntax Highlight
Plug 'sheerun/vim-polyglot'
Plug 'jlcrochet/vim-razor'
" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Snippets
Plug 'theniceboy/vim-snippets' 
" Undo Tree  undo树，可视化重做
Plug 'mbbill/undotree'
" Git
" gitignore templates
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" 在sign列中显示git diff。
Plug 'airblade/vim-gitgutter' 
" git日志查看
Plug 'cohama/agit.vim' 
" 命令行git
Plug 'tpope/vim-fugitive' 
" Autoformat
Plug 'Chiel92/vim-autoformat'
" CSharp
Plug 'OmniSharp/omnisharp-vim'
Plug 'nickspoons/vim-sharpenup'
" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'othree/html5.vim' " HTML5 +内联SVG全功能，Vim的缩进和语法。
Plug 'alvan/vim-closetag' " 自动关闭（X）HTML标签
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] } " JavaScript和Flow.js的语法高亮插件
Plug 'HerringtonDarkholme/yats.vim' " 另一个TypeScript语法
Plug 'posva/vim-vue' " Vue组件的Vim语法突出显示
Plug 'mattn/emmet-vim'  " Emmet 快速写标签
Plug 'elzr/vim-json'  "
" Go This plugin adds Go language support
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] } "修改了Vim的缩进行为以符合PEP8
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] } " 适用于Python和其他缩进语言的文本对象，可折叠等。
" Flutter
Plug 'dart-lang/dart-vim-plugin'
" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " 浏览器预览markdown文档
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] } " 制表模式
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] } " 生成md目录
Plug 'dkarter/bullets.vim' " 自动列表
" Editor Enhancement
Plug 'liuchengxu/vim-which-key'  " 显示绑定键信息
Plug 'jiangmiao/auto-pairs'  "成对插入或删除方括号，括号，引号。
Plug 'mg979/vim-visual-multi' " vim / neovim的多个游标插件
Plug 'tpope/vim-commentary'
Plug 'theniceboy/antovim' " gs to switch 反义词转换
Plug 'tpope/vim-surround' " 自动添加引号或者改变引号的种类，type ysw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " 在可视化模式时，在引号等中选择内容,in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'junegunn/vim-after-object' " 将文本对象定义为指定字符之后的目标文本。da= to delete what's after =
Plug 'godlygeek/tabular' " 对齐文本插件 ga, or :Tabularize <regex> to align
Plug 'easymotion/vim-easymotion' " 快速移动到字符所在位置，两个字符
Plug 'svermeulen/vim-subversive' " 多个替换，跟coc-rename类似？
Plug 'theniceboy/argtextobj.vim'
Plug 'LeafCage/yankround.vim'
Plug 'AndrewRadev/splitjoin.vim' " 单多行之间进行切换
Plug 'rhysd/clever-f.vim'
" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
" Documentation
Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc
" Mini Vim-APP
Plug 'mhinz/vim-startify' " 打开nvim时的界面
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'wesQ3/vim-windowswap' " move window <leader>ww
" Vim Applications
Plug 'itchyny/calendar.vim'
" file icons
Plug 'ryanoasis/vim-devicons' 
Plug 'kyazdani42/nvim-web-devicons'
" Other visual enhancement
Plug 'kien/rainbow_parentheses.vim'
" Plug 'mg979/vim-xtabline' " 标签栏
Plug 'romgrk/barbar.nvim'
Plug 'wincent/terminus' " 终端
" Other useful utilities
Plug 'lambdalisue/suda.vim' " 添加sudo操作 do stuff like :sudowrite
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc' " vim-session dep
" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user' " 创建自己的textobject
" Plug 'roxma/nvim-yarp'

call plug#end()

set re=0
" experimental
set lazyredraw
