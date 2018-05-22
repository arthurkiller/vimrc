" loaded the vundle settings
source ~/.vimrc.plug

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

syntax on
filetype on
filetype indent on

" set clipboard=unnamed
nnoremap <S-tab> :cclose <CR>

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
let g:formatterpath = ['/usr/local/bin']
let g:formatters_cpp = ['c']
let g:formatters_c = ['c']
let g:formatdef_c = '"astyle --style=google --indent=force-tab --pad-oper --pad-comma --pad-header"'
noremap <F8> :Autoformat<CR>
au BufWrite *.c,*.cpp,*.h,*.hpp :Autoformat
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

" vim-gutentags settings
"""""""""""""""""""
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"""""""""""""""""""

" ale settings
"""""""""""""""""""
let g:ale_linters = {'go': ['gofmt', 'go vet']}
"let g:ale_linters = {'go': ['gofmt', 'go vet', 'gometalinter']}
"let g:ale_linters = {'go': ['gometalinter', 'gofmt', 'golint', 'go vet']}
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 200
let g:ale_echo_delay = 50
let g:ale_lint_delay = 200
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '??'
let g:ale_go_gometalinter_options = '--fast -t --errors'
let g:ale_go_gofmt_options = '-s'
let g:ale_c_gcc_options = '-Wall -O2 -std=c99 -effective-c'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"hi! clear SpellBad
"hi! clear SpellCap
"hi! clear SpellRare
"hi! SpellBad gui=undercurl guisp=red
"hi! SpellCap gui=undercurl guisp=blue
"hi! SpellRare gui=undercurl guisp=magenta
"""""""""""""""""""

" YCM settings
"""""""""""""""""""
set completeopt-=preview
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_invoke_completion = '<c-x>'
let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_complete_mn_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_confirm_extra_conf=0
let g:ycm_enable_diagnostic_signs=1
let g:ycm_enable_diagnostic_highlighting=1
let g:ycm_register_as_syntastic_checker=1
set completeopt=menu,menuone
" c-x trigger completion
noremap <c-x> <NOP>
let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{3}'],
           \ 'cs,lua,javascript': ['re!\w{3}'],
           \}
let g:ycm_filetype_whitelist = {
            \ "c":1, "cpp":1, "h":1, "hpp":1, "cc":1,
            \ "go":1, "rs":1, "sh":1, "py":1, "lua":1,
            \}
" need to creat a .ycm_extra_conf.py for each project
" copy the global should be okay
au bufread,bufnewfile *.c let g:ycm_global_ycm_extra_conf = '~/.vim/ycm-plugin/c/.ycm_extra_conf.py'
au bufread,bufnewfile *.h,*.hpp,*.cpp,*.cc,*.cxx let g:ycm_global_ycm_extra_conf = '~/.vim/ycm-plugin/cpp/.ycm_extra_conf.py'
if filereadable(".ycm_extra_conf.py")
    let g:ycm_global_ycm_extra_conf = './.ycm_extra_conf.py'
endif
"""""""""""""""""""

" vim-airline settings
"""""""""""""""""""
set laststatus=2
nmap <tab> :bn<CR>
nmap <leader>x :bdelete<CR>
let g:airline_theme = "luna"
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tagbar#enabled=1
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

" TagBar
"""""""""""""""""""
nmap <F4> :TagbarToggle<CR>
"""""""""""""""""""

" gitgutter
"""""""""""""""""""
let g:gitgutter_signs = 0
nmap <leader>g :GitGutterSignsToggle<CR>
"""""""""""""""""""

" vim-go settings
"""""""""""""""""""
let g:go_get_update=0
let g:go_list_height=7
let g:go_list_autoclose = 1
let g:go_list_type="locationlist"
let g:go_list_type_commands={"GoBuild": "quickfix"}
let g:go_highlight_array_whitespace_error=1
let g:go_highlight_build_constraints=1
let g:go_highlight_chan_whitespace_error=1
let g:go_highlight_extra_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_function_arguments=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_string_spellcheck=1
let g:go_highlight_space_tab_error=1
let g:go_highlight_types=1
let g:go_highlight_trailing_whitespace_error=1
let g:go_fmt_command="goimports"
let g:go_fmt_autosave=1
let g:go_fmt_fail_silently=1
let g:go_def_reuse_buffer=1
let g:go_def_mode='guru'
let g:go_template_autocreate=0
nmap <leader>b :GoBuild<CR>
nmap <leader>r :GoRun<CR>
nmap <leader>t :GoTest<CR>
nmap <leader>i :GoInstall<CR>
nmap <leader>t :GoAddTags<CR>
nmap <leader>d :GoDocBrowser<CR>
nmap <leader>v :GoMetaLinter<CR>
nmap <leader>k :GoDescribe<CR>
nmap <leader>call :GoCallers<CR>
nmap <leader>stack :GoCallstack<CR>
au BufRead,BufNewFile *.go set filetype=go
"""""""""""""""""""

" LeaderF settings
"CTRL+P 在当前项目目录打开文件搜索
"CTRL+M 打开 MRU搜索,搜索你最近打开的文件
"CTRL+N 打开 Buffer 搜索
"CTRL+F 打开函数搜索
"""""""""""""""""""
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<c-n>'
noremap <c-m> :LeaderfMru<cr>
noremap <c-n> :LeaderfBuffer<cr>
noremap <c-f> :LeaderfFunction<cr>
noremap <c-t> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_NormalMap = {
   \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'],
   \            ["<F6>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'] ],
   \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'],
   \            ["<F6>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'] ],
   \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
   \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
   \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
   \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
   \ }
"""""""""""""""""""
