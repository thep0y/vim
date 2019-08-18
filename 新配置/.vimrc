set nocompatible
syntax on
filetype plugin indent on
set ic
set hlsearch
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,GB2312,big5
set cursorline
set autoindent
set showmatch    "显示匹配的括号
set smartindent
set scrolloff=4
set showmatch
set nu

let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99

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

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Chiel92/vim-autoformat' "自动格式化
Plugin 'Valloric/YouCompleteMe' "自动补全
Plugin 'jiangmiao/auto-pairs' " 自动补全括号和引号
Plugin 'kien/rainbow_parentheses.vim' "不同颜色括号
Plugin 'https://github.com/bling/vim-airline' " 状态栏
Plugin 'w0rp/ale'  " 代码检测
 let g:ale_fix_on_save = 1
 let g:ale_completion_enabled = 1
 let g:ale_sign_column_always = 1
 let g:airline#extensions#ale#enabled = 1



" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" 自动格式化
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

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

let g:ycm_min_num_of_chars_for_completion = 2  "开始补全的字符数"
let g:ycm_python_binary_path = 'python'  "jedi模块所在python解释器路径"
let g:ycm_seed_identifiers_with_syntax = 1  "开启使用语言的一些关键字查询"
let g:ycm_autoclose_preview_window_after_completion=1 "补全后自动关闭预览窗口"

au BufNewFile,BufRead *.py
            \ set tabstop=4   "tab宽度
            \ set softtabstop=4
            \ set shiftwidth=4
            \ set textwidth=79
            \ set expandtab       "tab替换为空格键
            \ set autoindent      "自动缩进
            \ set fileformat=unix   "保存文件格式

"  添加头部注释
function HeaderPython()
call setline(1, "#!/usr/bin/python3")
call append(1, "# -*- coding: utf8 -*-")
call append(2, "# Power by thepoy" . strftime('%Y-%m-%d %T', localtime()))
normal G
normal o
normal o
endf
autocmd bufnewfile *.py call HeaderPython()
