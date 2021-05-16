" loaded the vundle settings
source ~/.vimrc.plug
source ~/.vimrc.sign

" slient python 3
if has('python3')
  silent! python3 1
endif

" vim global config
set nu
set hlsearch
set incsearch
set expandtab
set smartindent
set smartcase
set encoding=utf-8
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set t_Co=256
set foldmethod=manual
set colorcolumn=120
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set completeopt=menu,menuone,preview,noselect,noinsert

" set colorscheme
colorscheme molokai
hi ColorColumn ctermbg=232

" set mapleader
let mapleader=";"

" set clipboard copy
set clipboard=unnamed

" add title
nnoremap <leader>ti :call AddTitle()<CR>'S
nnoremap <leader>tu :call UpdateTitle()<CR>'S

" set vim paset mode
nnoremap <S-tab> :cclose <CR>
nnoremap <leader>ps :set paste<CR>
nnoremap <leader>nps :set nopaste<CR>

" set tab for completion
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" : "\<TAB>"

" remember the cursor last open
" if takes no efforts, possible problem is that some files you DO NOT have access promession
autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
"====================================="

" vim ident
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
nmap <silent> <leader>hide :IndentGuidesToggle<CR>
hi IndentGuidesOdd  ctermbg=232
hi IndentGuidesEven ctermbg=233
"====================================="

" ale settings
set omnifunc=ale#completion#OmniFunc
nmap <silent> <leader>d :ALEDetail<CR>
nmap <silent> gd <Plug>(ale_go_to_definition)
nmap <silent> gr <Plug>(ale_find_references)
nmap <silent> gk <Plug>(ale_hover)
nmap <silent> sn <Plug>(ale_next_wrap)
nmap <silent> sp <Plug>(ale_previous_wrap)
let g:ale_linters={
    \   'go': ['gopls', 'golint'],
    \   'python': ['autopep8', 'flake8', 'pylint'],
    \   'proto': ['protoc-gen-lint'],
    \   'c': ['ccls'],
    \   'cpp': ['ccls'],
    \   'php': ['phpcs', 'phpcbf'],
    \   'csh': ['shell'],
    \   'zsh': ['shell'],
    \}
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'cpp': ['clangtidy', 'trim_whitespace'],
    \   'shell': ['shell'],
    \   'php': ['phpcbf'],
    \   'python': ['yapf'],
    \}
let g:ale_writegood_use_global = 1
let g:ale_fix_on_save=1
let g:ale_completion_enabled=1
let g:ale_completion_delay=300
let g:ale_completion_max_suggestions=20
let g:ale_set_balloons=0
let g:ale_cursor_detail=0
let g:ale_close_preview_on_insert=1
let g:ale_linters_explicit=1
let g:ale_lint_delay=500
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1
let g:ale_sign_error='✗✗'
let g:ale_sign_warning='ϟϟ'
let g:ale_echo_delay=500
let g:ale_echo_msg_format='[%severity%] [%linter%] %code: %%s'
let g:ale_python_flake8_options='--ignore=E501'
let g:ale_python_autopep8_options='--ignore=E501'
let g:ale_cpp_ccls_init_options= {
    \   'cache': {
    \       'directory': '/Users/arthur/.cache/ccls',
    \       'cacheFormat': 'binary',
    \   },
    \   'diagnostics': {
    \     'onOpen': 0,
    \     'opChange': 1000,
    \   },
    \   'clang': {
    \       'extraArgs': [
	\			'-isystem', '/usr/local/opt/llvm/include/c++/v1',
	\			'-isystem', '/usr/local/Cellar/llvm/11.1.0/lib/clang/11.1.0/include',
    \       ],
    \   	'resourceDir': '/usr/local/opt/llvm/lib/clang/11.1.0',
    \   },
    \}
let g:ale_c_ccls_init_options= {
    \   'cache': {
    \       'directory': '/Users/arthur/.cache/ccls',
    \       'cacheFormat': 'binary',
    \   },
    \   'diagnostics': {
    \     'onOpen': 0,
    \     'opChange': 1000,
    \   },
    \   'clang': {
    \       'extraArgs': [
	\			'-isystem', '/usr/local/opt/llvm/include/c++/v1',
	\			'-isystem', '/usr/local/Cellar/llvm/11.1.0/lib/clang/11.1.0/include',
    \       ],
    \   	'resourceDir': '/usr/local/opt/llvm/lib/clang/11.1.0',
    \   },
    \}
let g:ale_go_gofmt_options='-s'
let g:ale_c_parse_makefile=1
"let g:ale_proto_protoc_gen_lint_options='-I /Users/arthur/codes/src/icode.baidu.com/baidu/bdrp/jarvis/grpc'

" vim-go settings
let g:go_gopls_enabled=0
let g:go_code_completion_enabled=0
let g:go_def_mapping_enabled=0
let g:go_get_update=0
let g:go_list_height=7
let g:go_list_autoclose=1
let g:go_list_type="locationlist"
let g:go_list_type_commands={"GoBuild": "quickfix"}
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_extra_types=1
let g:go_highlight_functions=1
let g:go_highlight_function_parameters=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_string_spellcheck=1
let g:go_highlight_chan_whitespace_error=1
let g:go_highlight_array_whitespace_error=1
let g:go_highlight_trailing_whitespace_error=1
let g:go_highlight_build_constraints=1
let g:go_highlight_generate_tags=1
let g:go_highlight_space_tab_error=1
let g:go_highlight_function_calls=1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 0
let g:go_fmt_command="goimports"
let g:go_fmt_autosave=1
let g:go_fmt_fail_silently=1
let g:go_template_autocreate=0
noremap <silent> <leader>b :GoBuild<CR> "noremap <silent> <leader>r :GoRun<CR>
noremap <silent> <leader>t :GoAddTags<CR>
noremap <silent> <leader>i :GoInstall<CR>
noremap <silent> <leader>v :GoMetaLinter<CR>
noremap <silent> <leader>a :GoDescribe<CR>
noremap <silent> <leader>cs :GoCallstack<CR>
noremap <silent> <leader>ca :GoCallers<CR>
noremap <silent> <leader>ce :GoCallees<CR>
noremap <silent> <leader>key :GoKeyify<CR>
noremap <silent> <leader>doc :GoDocBrowser<CR>
noremap <silent> <leader>imp :GoImplements<CR>
noremap <silent> <leader>test :GoTest<CR>
noremap <silent> <leader>peer :GoChannelPeers<CR>
noremap <silent> <leader>free :GoFreevars<CR>
"====================================="

" vim-cpp-enhanced-highlight
let g:cpp_concepts_highlight=1
let g:cpp_class_decl_highlight=1
let g:cpp_no_function_highlight=1
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
"====================================="

" rust.vim
let g:rustfmt_autosave=1
"====================================="

" auto pair the symble
let g:AutoPairsFlyMode=0
"====================================="

" auto format code with extention name of file
let g:formatterpath=['/usr/local/bin']
let g:formatdef_my_c="'astyle --mode=c --style=google --indent=space --pad-oper --pad-comma --pad-header --convert-tabs'"
let g:formatdef_my_py= "'autopep8 - --range '.a:firstline.' '.a:lastline"
let g:formatters_cpp=['my_c']
let g:formatters_c=['my_c']
let g:formatters_python = ['my_py']
let g:formatter_yapf_style = 'pep8'
nmap <silent> <leader>fmt :Autoformat<CR>
au BufWrite *.c,*.cpp,*.h,*.hpp,:Autoformat
"====================================="

" vim markdown
set conceallevel=0
let g:vim_markdown_math=1
let g:vim_markdown_autowrite=1
let g:vim_markdown_toc_autofit=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_follow_anchor=1
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_toml_frontmatter=1
let g:vim_markdown_json_frontmatter=1
let g:vim_markdown_fenced_languages=['csharp=cs','golang=go','c++=cpp', 'viml=vim', 'bash=sh']
let g:vim_markdown_emphasis_multiline=0
"====================================="

" markdown preview tools
nmap <silent> <leader>md <Plug>MarkdownPreview
let g:mkdp_path_to_chrome="/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
"====================================="

" vim-gutentags settings
let g:gutentags_project_root=['.git', 'Makefile']
let g:gutentags_ctags_tagfile='.tags'
let g:gutentags_ctags_extra_args=['--fields=+niazS', '--extra=+q', '--c++-kinds=+px', '--c-kinds=+px', '--sort=yes']
let g:gutentags_auto_add_gtags_cscope = 1
let s:vim_tags=expand('~/.cache/tags')
let g:gutentags_cache_dir=s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"====================================="

" vim-airline settings
set laststatus=2
nmap <silent> <tab> :bn<CR>
nmap <silent> <leader>x :bdelete<CR>
let g:airline_theme="luna"
let g:airline_powerline_fonts=1
let g:airline_detect_spelllang=0
let g:airline_highlighting_cache=1
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'z', 'error', 'warning' ]
    \ ]
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#fugitiveline#enabled=1
let g:airline#extensions#gutentags#enabled=1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>< <Plug>AirlineSelectPrevTab
nmap <leader>> <Plug>AirlineSelectNextTab
"====================================="

" NERDTree
nmap <silent> <leader>tree :NERDTreeMirror<CR>
nmap <silent> <leader>tree :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"====================================="

" TagBar
nmap <silent> <leader>tagbar :TagbarToggle<CR>
let g:tagbar_width=40
let g:tagbar_compact=1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
"====================================="

" fugitive
nmap <silent> <leader>ba :Gblame<CR>
nmap <silent> <leader>pull :Gpull<CR>
"====================================="

" gitgutter
let g:gitgutter_signs=0
nmap <silent> <leader>g :GitGutterSignsToggle<CR>
"====================================="

" LeaderF settings
noremap <silent> <c-p> :LeaderfMruCwd<CR>
let g:Lf_ShortcutF = '<C-F>'
let g:Lf_StlSeparator={ 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers=['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode='Ac'
let g:Lf_WindowHeight=0.30
let g:Lf_CacheDirectory=expand('~/.vim/cache')
let g:Lf_ShowRelativePath=0
let g:Lf_HideHelp=1
let g:Lf_StlColorscheme='powerline'
"====================================="

" dash
nmap <silent> <leader>d <Plug>DashSearch
"====================================="

" rainbow pairs
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
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
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 1
"====================================="

" ack search
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let g:ack_default_options =
              \ " -s -H --nocolor --nogroup --column --smart-case --follow"
  let g:ackhighlight = 1
  let g:ack_autoclose = 1
  let g:ack_autofold_results = 1
  let g:ackpreview = 1
endif
"====================================="
