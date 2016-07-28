set shell=/bin/bash
set nu
set hlsearch
set incsearch
set nocompatible
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent
set smartcase
set backspace=indent,eol,start
syntax on
filetype on
filetype indent on
colorscheme molokai
set t_Co=256

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'SirVer/ultisnips'
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" remember the cursor last open
if has("autocmd")
autocmd BufReadPost * 
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif|
\set viminfo='1000,f1,<500
endif

" vim markdown tools
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_emphasis_multiline = 0
nmap <silent> <F5> <Plug>MarkdownPreview

"  YCM settings
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

" UltiSnips setting
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" set mapleader
let mapleader = ";"

" vim-airline
set laststatus=2
let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
nmap <leader>j :bn<CR>
nmap <leader>x :bdelete<CR>
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0

" vim-go custom mappings
nmap <Leader>b :GoBuild<CR>
nmap <Leader>r :GoRun<CR>

" NERDTree
nmap <F3> :NERDTreeMirror<CR>
nmap <F3> :NERDTreeToggle<CR>

"TagBar
nmap <F4> :TagbarToggle<CR>

" vim-go settings
let g:go_fmt_command = "goimports"
au BufRead,BufNewFile *.go set filetype=go
