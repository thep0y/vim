set number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
" 解决插入模式下delete/backspce键失效问题
set backspace=2

set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/zenburn/colors/zenburn.vim
call vundle#begin()
 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
" github上的插件
" 来自于http://vim-scripts.org/vim/scripts.html的插件
Plugin 'L9'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup'
Plugin 'vim-syntastic/syntastic'   " 语法检查
Plugin 'nvie/vim-flake8'   " 添加flake8代码风格检查
Plugin 'scrooloose/nerdtree' " 给vim添加一个树形目录
" Plugin 'Valloric/YouCompleteMe'   " 自动补全， 在手动编译后取消注释
Plugin 'Xuyuanp/nerdtree-git-plugin'    " 为nerdtree添加git支持
Plugin 'altercation/vim-colors-solarized' " 配色方案
" Plugin 'jnurmine/zenburn'                 " 配色方案
Plugin 'morhetz/gruvbox'                 " 配色方案
Plugin 'Lokaltog/powerline'  " 美化状态栏
Plugin 'Yggdroot/indentLine'  " 缩进指示线
Plugin 'tell-k/vim-autopep8'  " 自动格式化工具
Plugin 'jiangmiao/auto-pairs' " 自动补全括号和引号
Plugin 'kien/rainbow_parentheses.vim' "不同颜色括号
Plugin 'kien/ctrlp.vim'  " 搜索插件，在vim normal模式下，Ctrl+p,输入查询文件查找文件
Plugin 'tpope/vim-fugitive'  " git集成插件，在vim中运行git命令
Plugin 'tmhedberg/SimpylFold' " 根据每行缩进进行折叠
Plugin 'junegunn/vim-plug' " pony.vim是Django项目的插件
Plugin 'jistr/vim-nerdtree-tabs' " NERDTree共享插件
Plugin 'jmcomets/vim-pony' " pony.vim是Django项目的插件
Plugin 'mattn/emmet-vim'    " html插件 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if $TERM != 'linux'
    set mouse=a        "启用鼠标
endif

set nowrap    "不自动折行
set showmatch    "显示匹配的括号
set scrolloff=3        "距离顶部和底部3行"
set encoding=utf-8  "编码
set fenc=utf-8      "编码
set hlsearch        "搜索高亮
let python_highlight_all=1
syntax on    "语法高亮

set splitbelow
set splitright

set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar

map <C-N>:NERDTreeToggle<CR> " 开启树形目录的快捷键

let NERDTreeShowLineNumbes=1
let NERDTreeAutoCenter=1
let NERDTreeWinSize=30
let g:nerdtree_tabs_open_on_console_startup=0
" 当vim打开一个目录时，nerdtree自动使用
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

nnoremap <space> za
nnoremap <C-J> <C-W><C-J>  
nnoremap <C-K> <C-W><C-K>  
nnoremap <C-L> <C-W><C-L>  
nnoremap <C-H> <C-W><C-H>  
" nnoremap <S-h> :exec "!python -c \" help(' ".expand("<cword>")."')\""<CR> 按H查看Python的帮助

"F5运行python3
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc

" F3开关树状图
map <F3> :NERDTreeToggle<cr>

let g:indentLine_char = '|'                 " 设置对齐线的字符
let g:indentLine_first_char = '|'           " 设置对齐线的首字符
let g:indentLine_showFirstIndentLevel = 1   " 显示对齐线首字符
let g:indentLine_color_term = "darkgray"     " 设置对齐线颜色
let g:indent_guides_guide_size=2

let g:ycm_min_num_of_chars_for_completion = 2  "开始补全的字符数"
let g:ycm_python_binary_path = 'python'  "jedi模块所在python解释器路径"
let g:ycm_seed_identifiers_with_syntax = 1  "开启使用语言的一些关键字查询"
let g:ycm_autoclose_preview_window_after_completion=1 "补全后自动关闭预览窗口"

let g:user_emmet_mode='n'   " only enable normal mode functions
" let g:user_emmet_mode='inv' " enable all functions,which is equal to
" let g:user_emmet_mode='a'   " enable all function in all mode
" Enable just for html/css
let g:user_emmet_install_globle = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Y>'

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 代码跳转
let g:ycm_auto_trigger = 1   "turn on

let g:SimpylFold_docstring_preview=1 

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

if has('gui_runing')
    set background=dark
    colorscheme solarized
else 
    " colorscheme zenburn
    set background=dark
    colorscheme gruvbox
endif

let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>


au BufNewFile,BufRead *.py
            \ set tabstop=4   "tab宽度
            \ set softtabstop=4 
            \ set shiftwidth=4 
            \ set textwidth=79
            \ set expandtab       "tab替换为空格键
            \ set autoindent      "自动缩进
            \ set fileformat=unix   "保存文件格式

au BufNewFile,BufRead *.js,*.css,*.html
            \ set tabstop=4
            \ set softtabstop=4
            \ set shiftwidth=4
            \ set expandtab
            \ set autoindent


highlight BadWhitespace ctermbg=red guibg=darkred  
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"  添加头部注释
function HeaderPython()
call setline(1, "#!/usr/bin/python3")
call append(1, "# -*- coding: utf-8 -*-")
call append(2, "# Power by thepoy, " . strftime('%Y-%m-%d %T', localtime()))
normal G
normal o
normal o
endf
autocmd bufnewfile *.py call HeaderPython()

" 不同颜色括号
let g:rbpt_colorpairs = [
                        \ ['brown',       'RoyalBlue3'],
                        \ ['Darkblue',    'SeaGreen3'],
                        \ ['darkgray',    'DarkOrchid3'],
                        \ ['darkgreen',   'firebrick3'],
                        \ ['darkcyan',    'RoyalBlue3'],
                        \ ['darkred',     'SeaGreen3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['brown',       'firebrick3'],
                        \ ['gray',        'RoyalBlue3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['Darkblue',    'firebrick3'],
                        \ ['darkgreen',   'RoyalBlue3'],
                        \ ['darkcyan',    'SeaGreen3'],
                        \ ['darkred',     'DarkOrchid3'],
                        \ ['red',         'firebrick3'],
                        \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" F8 自动格式化
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

