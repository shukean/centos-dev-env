syntax on
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align Plug 'junegunn/vim-easy-align'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'bronson/vim-trailing-whitespace' "多余的空格标红
Plug 'scrooloose/nerdcommenter' "shift+v+方向键选中(默认当前行)   ->  ,cc  加上注释  -> ,cu 解开注释
Plug 'Raimondi/delimitMate' "括号补全
Plug 'bling/vim-airline' "状态  :bd 关闭tab
Plug 'vim-airline/vim-airline-themes'
Plug 'zivyangll/git-blame.vim'
Plug 'rondale-sc/vim-spacejam' " 去除空格
Plug 'derekwyatt/vim-fswitch'  " 头文件和实现切换 :FSHere
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

syntax on                   " Syntax highlighting
scriptencoding utf-8
set nofoldenable  " disable code folding
set wrap
set incsearch
set t_ti= t_te=
set nolist
set mouse=v                 " Automatically enable mouse usage
set cursorline                  " Highlight current line
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
"set showmatch                   " Show matching brackets/parenthesis
"set matchtime=1                 " Show Matching time second
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set autoindent                  " Indent at the same level of the previous line
set expandtab                   " Tabs are spaces, not tabs
set shiftwidth=4                " use indents of 4 spaces
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " Let backspace delete indent
set smarttab
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
"set clipboard=unnamed
set ruler                       " dispaly status on bottom
set rulerformat=%30(%2*%f\ %m%r\ %3l,%L\ %c\ %p%%%)
set autoread                    " auto load file change
set t_Co=256
set laststatus=2
set cc=120
"set shiftround


"Solarized"
let g:solarized_termcolors=256
let g:solarized_degrade=0
let g:solarized_termtrans=1
set background=dark
"set background=light
colorscheme solarized
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"tree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"map <C-m> :TlistToggle<CR>
nmap <C-m> :TagbarToggle<CR>


"reload cur pwd conf
let mapleader=","


" copy to system
"nnoremap <leader>cy "+y
"nnoremap <leader>cp "+p

"vim-fswitch
nmap <silent> <Leader>sw :FSHere<cr>


"ycm setting
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'


"nnoremap <leader>jj :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jj :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jt :YcmCompleter GetType<CR>
" Ctrl + O jump pre
" Ctrl + I jump next
let g:ycm_show_diagnostics_ui = 0
"let g:ycm_error_symbol = '✗'
"let g:ycm_warning_symbol = '⚠'


let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_server_python_interpreter = 'python3'
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
"ycm end


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1


"scrooloose/syntastic setting
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"let g:syntastic_python_checkers = ['pylint']
"scrooloose/syntastic end


let g:spacejam_filetypes = 'php,html,shell,css,python,c,cpp,javascript,vim'


"let g:Powerline_symbols = 'fancy'
let g:ctrlp_working_path_mode = 'ra'

"let g:airline_theme = 'luna'
let g:airline_theme = 'soda'

"let g:phpcomplete_relax_static_constraint = 1
"let g:phpcomplete_mappings = {
   "\ 'jump_to_def': ',jj',
   "\}
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType php set completefunc=phpcomplete#CompletePHP
"autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
autocmd FileType python setlocal ts=4 sw=4 sts=4 expandtab

"fix crontab
autocmd filetype crontab setlocal nobackup nowritebackup

" Default fzf layout
" - down / up / left / right
let g:fzf_command_prefix = 'Fzf'
let g:fzf_tags_command = 'ctags -R --langmap=c++:+.ic --exclude=.git --exclude=test --exclude=output --exclude=build'
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~25%' }

nnoremap <silent> <C-p> :FzfFiles<CR>
nnoremap <leader>a :FzfAg<CR>
nnoremap <leader>t :FzfTags<CR>
nnoremap <leader>f :FzfFiles<CR>
nnoremap <leader>b :FzfBuffers<CR>
nnoremap <leader>l :FzfLines<CR>

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

function! SetTab(n)
    let &shiftwidth = a:n
    let &tabstop = a:n
    let &softtabstop = a:n
endfunction

command Settab2 call SetTab(2)
command Settab4 call SetTab(4)

function! CheckTab2()
    let l:current_dir = getcwd()
    if l:current_dir =~ 'mysql'
        call SetTab(2)
    else
        call SetTab(4)
    endif
endfunction

autocmd BufRead,BufNewFile * call CheckTab2()

function! CopyrightTitle()
    call append(0, "/***************************************************************************")
    call append(1, "* Copyright (c) xxxxx.com, Inc. All Rights Reserved")
    call append(2, "**************************************************************************/")
    call append(3, "/**")
    call append(4, "* @file ".expand("%"))
    call append(5, "* @author yukeyong@xxxx.com")
    call append(6, "* @brief")
    call append(7, "*/")
    call append(8, "")
    call append(9, "#pragma once")
    echohl WarningMsg | echo "Add copyright msg." | echohl None
endfunction

nnoremap <leader>h :call CopyrightTitle()<CR>

