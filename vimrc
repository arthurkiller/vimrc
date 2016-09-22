source ~/.vimrc.vundle

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

" set mapleader
let mapleader = ";"

" remember the cursor last open
autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

" vim markdown tools
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_emphasis_multiline = 0
nmap <silent> <F5> <Plug>MarkdownPreview

"  YCM settings
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1


" vim-airline
set laststatus=2
let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
nmap <tab> :bn<CR>
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
