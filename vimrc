" loaded the vundle settings
source ~/.vimrc.vundle

"""""""""""""""""""
" vim global config
set nu
set hlsearch
set incsearch
set nocompatible
set expandtab
set smartindent
set smartcase
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set t_Co=256
set foldmethod=marker
" set clipboard=unnamed
nnoremap <S-tab> :cclose <CR>

syntax on
filetype on
filetype indent on

" set for the code line up tool
set list
set lcs=tab:\|\ ,nbsp:%,trail:-
highlight LeaderTab guifg=#666666
match LeaderTab /^\t/"

" choose your colorscheme
colorscheme molokai

" set mapleader
let mapleader=";"

" remember the cursor last open
" if takes no efforts, possible problem is that some files you DO NOT have access promession
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
"""""""""""""""""""

" auto pair the symble
"""""""""""""""""""
let g:AutoPairsFlyMode=0
"""""""""""""""""""

" auto format code with extention name of file
"""""""""""""""""""
let g:formatterpath = ['/usr/bin']
let g:formatters_cpp = ['c']
let g:formatters_c = ['c']
let g:autoformat_retab=1
let g:autoformat_remove_trailing_spaces=0
let g:formatdef_c = '"astyle --style=google --indent=spaces=4 --indent-cases
            \ --indent-namespaces --indent-modifiers --indent-labels --indent-switches
            \ --indent-preproc-block --indent-preproc-define --break-blocks --pad-oper
            \ --pad-comma --pad-header --delete-empty-lines --convert-tabs --add-brackets"'
noremap <F8> :Autoformat<CR>
"""""""""""""""""""

" vim markdown preview tools
"""""""""""""""""""
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
let g:mkdp_path_to_chrome="/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_toc_autofit=1
let g:vim_markdown_emphasis_multiline=0
nmap <silent> <F5> <Plug>MarkdownPreview
"""""""""""""""""""

" Syntastic
"""""""""""""""""""
let g:syntastic_go_checkers=['go']
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='!!'
let g:syntastic_style_error_symbol='!!'
let g:syntastic_warning_symbol='??'
let g:syntastic_style_warning_symbol='??'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=1
let g:syntastic_aggregate_errors=1
let g:syntastic_auto_loc_list=0 "disable the quickfix window
"""""""""""""""""""

" YCM settings
"""""""""""""""""""
set completeopt-=preview
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_mn_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_enable_diagnostic_signs=1
let g:ycm_enable_diagnostic_highlighting=1
let g:ycm_register_as_syntastic_checker=1
au bufread,bufnewfile *.c let g:ycm_global_ycm_extra_conf = '~/.vim/ycm-plugin/c/.ycm_extra_conf.py'
au bufread,bufnewfile *.h,*.hpp,*.cpp,*.cc,*.cxx let g:ycm_global_ycm_extra_conf = '~/.vim/ycm-plugin/cpp/.ycm_extra_conf.py'
if filereadable(".ycm_extra_conf.py")
    let g:ycm_global_ycm_extra_conf = './.ycm_extra_conf.py'
endif
" need to creat a .ycm_extra_conf.py for each project
" copy the global should be okay
"""""""""""""""""""

" vim-airline
"""""""""""""""""""
set laststatus=2
nmap <tab> :bn<CR>
nmap <leader>x :bdelete<CR>
let g:airline_theme="luna"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#ycm#enabled=1
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
"""""""""""""""""""

" NERDTree
"""""""""""""""""""
nmap <F3> :NERDTreeMirror<CR>
nmap <F3> :NERDTreeToggle<CR>
"""""""""""""""""""

" ctags shortcut
" just for C++ code
"""""""""""""""""""
nmap <F6> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"""""""""""""""""""

" TagBar
"""""""""""""""""""
nmap <F4> :TagbarToggle<CR>
"""""""""""""""""""

" vim-go settings
"""""""""""""""""""
let g:go_get_update=0
let g:go_list_type="quickfix"
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_fields=1
let g:go_highlight_types=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
let g:go_fmt_command="goimports"
let g:go_fmt_autosave=1
let g:go_fmt_fail_silently=1
let g:go_def_reuse_buffer=1
let g:go_def_mode='godef'
let g:go_template_autocreate=0
nmap <leader>b :GoBuild<CR>
nmap <leader>r :GoRun<CR>
nmap <leader>t :GoTest<CR>
nmap <leader>cs :GoCallstack<CR>
nmap <leader>i :GoInstall<CR>
nmap <leader>vet :GoMetaLinter<CR>
au BufRead,BufNewFile *.go set filetype=go
"""""""""""""""""""
