autocmd filetype crontab setlocal nobackup nowritebackup

" loaded the vundle settings
source ~/.vimrc.plug
source ~/.vimrc.sign

" slient python 3
if has('python3')
    silent! python3 1
endif

" vim global config
set encoding=utf-8
set nu
set hlsearch
set incsearch
set expandtab

"
set autoindent
set smartindent
"

set shiftwidth=4
set tabstop=4
set smartindent
set smartcase
set backspace=indent,eol,start
set foldmethod=manual
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set completeopt=menu,menuone,preview,noselect,noinsert
set t_Co=256
set colorcolumn=120
hi ColorColumn ctermbg=232

" set colorscheme
colorscheme molokai

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
nmap <silent> <leader>f :ALEFix<CR>
nmap <silent> gd <Plug>(ale_go_to_definition)
nmap <silent> gr <Plug>(ale_find_references)
nmap <silent> gk <Plug>(ale_hover)
nmap <silent> sn <Plug>(ale_next_wrap)
nmap <silent> sp <Plug>(ale_previous_wrap)

let g:ale_lint_on_save=1
let g:ale_lint_delay=500
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1
let g:ale_linters_explicit=1
let g:ale_linters={
            \   'go': ['gopls', 'golint'],
            \   'python': ['autopep8', 'flake8', 'pylint'],
            \   'proto': ['protoc-gen-lint'],
            \   'c': ['clangd', 'clangtidy', 'clang-format'],
            \   'cpp': ['clangd', 'clangtidy', 'clang-format'], 
            \   'json': ['jq'],
            \   'csh': ['shell'],
            \   'zsh': ['shell'],
            \}
let g:ale_fixers={
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['add_blank_lines_for_python_control_statements', 'autoimport', 'reorder-python-imports', 'yapf', 'autoflake', 'autopep8', 'black'],
            \   'shell': ['shell'],
            \   'json': ['jq'],
            \   'c': ['clangtidy', 'clang-format'],
            \   'cpp': ['clangtidy', 'clang-format'], 
            \}
let g:ale_fix_on_save=0
let g:ale_floating_preview=1
let g:ale_completion_enabled=1
let g:ale_completion_delay=300
let g:ale_completion_max_suggestions=20
let g:ale_set_balloons=0
let g:ale_cursor_detail=0
let g:ale_close_preview_on_insert=1
let g:ale_sign_error='✗✗'
let g:ale_sign_warning=''
let g:ale_echo_delay=500
let g:ale_echo_msg_format='[%linter%] [%severity%] %code: %%s'
let g:ale_c_clangformat_use_local_file=1
let g:ale_c_clangformat_style_option={
            \   'BasedOnStyle': 'Google',
            \   'Language': 'Cpp',
            \   'UseTab': 'Never',
            \   'IndentWidth': '4',
            \   'AccessModifierOffset': '-4',
            \   'DerivePointerAlignment': 'false',
            \   'PointerAlignment': 'Right',
            \   'AlignConsecutiveMacros': 'Consecutive',
            \   'BreakBeforeBinaryOperators': 'All',
            \   'ColumnLimit': '0',
            \   'SpacesBeforeTrailingComments': '1',
            \   'SortIncludes': 'Never',
            \   'SortUsingDeclarations': 'false'
            \}
let g:ale_cpp_clangtidy_options="-*, -fuchsia-default-arguments-calls, -google-readability-casting, -llvm-header-guard, -llvm-else-after-return, -llvmlibc-*, -altera-*, -bugprone-easily-swappable-parameters, -cppcoreguidelines-macro-usage, -cppcoreguidelines-avoid-goto, -cppcoreguidelines-avoid-c-arrays, -cppcoreguidelines-avoid-magic-numbers, -cppcoreguidelines-special-member-functions, -cppcoreguidelines-pro-type-vararg, -cppcoreguidelines-pro-type-cstyle-cast, -cppcoreguidelines-pro-type-reinterpret-cast, -cppcoreguidelines-prefer-member-initializer, -cppcoreguidelines-pro-bounds-pointer-arithmetic, -cppcoreguidelines-pro-bounds-array-to-pointer-decay, -cppcoreguidelines-avoid-non-const-global-variables, -cppcoreguidelines-pro-bounds-constant-array-index, -modernize-use-nodiscard, -modernize-use-trailing-return-type, -modernize-return-braced-init-list, -modernize-avoid-c-arrays, -misc-non-private-member-variables-in-classes, -hicpp-use-auto, -hicpp-avoid-goto, -hicpp-signed-bitwise, -hicpp-no-array-decay, -hicpp-special-member-functions, -hicpp-braces-around-statements, -readability-identifier-length, -readability-magic-numbers, -readability-use-anyofallof, -readability-else-after-return, -readability-implicit-bool-conversion, -readability-braces-around-statements, -readability-redundant-access-specifiers, -readability-function-cognitive-complexity"
let g:ale_cpp_clangtidy_extra_options="{key: readability-identifier-naming.PrivateMemberSuffix, value: _}, {key: readability-identifier-naming.PrivateMemberCase, value: lower_case}, { key: readability-identifier-naming.MethodCase, value: camelBack}"
let g:ale_writegood_use_global=1
let g:ale_c_clangd_options='--query-driver=./,/usr/local/opt/llvm/lib,/usr/local/opt/llvm/include,/usr/local/include,/usr/local/lib,/usr/local/Cellar/llvm/13.0.1_1/lib,/usr/local/Cellar/llvm/13.0.1/include --all-scopes-completion --background-index -j=8 --pch-storage=memory'
let g:ale_cpp_clangd_options='--query-driver=./,/usr/local/opt/llvm/lib,/usr/local/opt/llvm/include,/usr/local/include,/usr/local/lib,/usr/local/Cellar/llvm/13.0.1_1/lib,/usr/local/Cellar/llvm/13.0.1/include --all-scopes-completion --background-index -j=8 --pch-storage=memory'
let g:ale_cpp_ccls_init_options={
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
            \           '-isystem', '/usr/local/opt/llvm/include/',
            \           '-isystem', '/usr/local/Cellar/llvm/13.0.1_1/lib/clang/13.0.1/include',
            \       ],
            \       'resourceDir': '/usr/local/opt/llvm/lib/clang/13.0.1',
            \   },
            \}
let g:ale_c_ccls_init_options={
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
            \           '-isystem', '/usr/local/opt/llvm/include',
            \           '-isystem', '/usr/local/Cellar/llvm/13.0.1_1/lib/clang/13.0.1/include',
            \       ],
            \       'resourceDir': '/usr/local/opt/llvm/lib/clang/13.0.1',
            \   },
            \}
let g:ale_go_gofmt_options='-s'
let g:ale_c_parse_makefile=1
let g:ale_python_pylint_executable='python3'
let g:ale_python_pylint_options='--disable=C0111'
let g:ale_python_flake8_options='--ignore=E501'
let g:ale_python_autopep8_options='--ignore=E501'
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
"noremap <silent> <leader>b :GoBuild<CR>
"noremap <silent> <leader>r :GoRun<CR>
"noremap <silent> <leader>t :GoAddTags<CR>
"noremap <silent> <leader>i :GoInstall<CR>
"noremap <silent> <leader>v :GoMetaLinter<CR>
"noremap <silent> <leader>a :GoDescribe<CR>
"noremap <silent> <leader>cs :GoCallstack<CR>
"noremap <silent> <leader>ca :GoCallers<CR>
"noremap <silent> <leader>ce :GoCallees<CR>
"noremap <silent> <leader>key :GoKeyify<CR>
"noremap <silent> <leader>doc :GoDocBrowser<CR>
"noremap <silent> <leader>imp :GoImplements<CR>
"noremap <silent> <leader>test :GoTest<CR>
"noremap <silent> <leader>peer :GoChannelPeers<CR>
"noremap <silent> <leader>free :GoFreevars<CR>
"====================================="

" vim-cpp-enhanced-highlight
let g:cpp_concepts_highlight=1
let g:cpp_class_decl_highlight=1
let g:cpp_no_function_highlight=1
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
"====================================="

" auto pair the symble
let g:AutoPairsFlyMode=0
"====================================="

" auto format code with extention name of file
"let g:formatterpath=['/usr/local/bin']
"let g:formatdef_my_c="'astyle --mode=c --style=google --indent=spaces --pad-oper --pad-comma --pad-header --convert-tabs'"
"let g:formatdef_my_py="'autopep8 - --range '.a:firstline.' '.a:lastline"
"let g:formatters_cpp=['my_c']
"let g:formatters_c=['my_c']
"let g:formatters_python=['my_py']
"let g:formatter_yapf_style='pep8'
"nmap <silent> <leader>fmt :Autoformat<CR>
"au BufWrite *.c,*.cpp,*.h,*.hpp :Autoformat
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
let g:vim_markdown_fenced_languages=['csharp=cs', 'golang=go', 'c++=cpp', 'viml=vim', 'bash=sh']
let g:vim_markdown_emphasis_multiline=0
"====================================="

" markdown preview tools
nmap <silent> <leader>md <Plug>MarkdownPreview
let g:mkdp_path_to_chrome="/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
"====================================="


" LeaderF settings
let g:Lf_ShortcutF = '<C-F>'
nnoremap <C-J> :LeaderfFunctionAll<CR>
nnoremap <C-P> :LeaderfTag<CR>
let g:Lf_RootMarkers=['.project', '.root', '.svn', '.git', 'Makefile', 'CMakeLists.txt', 'SConstruct']
let g:Lf_WorkingDirectoryMode='Ac'
let g:Lf_ShowRelativePath=1
let g:Lf_HideHelp=1
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_StlColorscheme='powerline'
let g:Lf_ShowDevIcons = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsGutentags = 1
let g:Lf_GtagsSource = 2
let g:Lf_GtagsSkipUnreadable = 1
let g:Lf_CacheDirectory = expand('~/.cache/tags')
"if !isdirectory('~/.cache/tags/.LfCache/gtags')
"    silent! call mkdir('~/.cache/tags/.LfCache/gtags', 'p')
"endif
let g:Lf_WindowPosition = 'popup'
let g:Lf_AutoResize = 1
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 1,
        \ 'Mru': 0,
        \ 'Tag': 1,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 1,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 1
        \}
"====================================="

" vim-gutentags settings
let g:gutentags_project_root=['.git', 'Makefile', 'CMakeLists.txt', 'SConstruct', '.project', '.root', '.svn']
let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'/.LfCache/gtags')
"let g:gutentags_modules = ['gtags_cscope']
let g:gutentags_modules = ['ctags']
let g:gutentags_ctags_tagfile='.tags'
let g:gutentags_ctags_extra_args=['--fields=+niazS', '--extra=+q', '--c++-kinds=+px', '--c-kinds=+px', '--sort=yes']

"let g:gutentags_modules = []
"if executable('ctags')
"	let g:gutentags_modules += ['ctags']
"endif
"if executable('gtags-cscope') && executable('gtags')
"	let g:gutentags_modules += ['gtags_cscope']
"endif
"====================================="

" vim-airline settings
set laststatus=2
nmap <silent> <tab> :bn<CR>
nmap <silent> <leader>x :bdelete<CR>
let g:airline_theme="luna"
let g:airline_powerline_fonts=1
let g:airline_detect_spelllang=0
let g:airline_highlighting_cache=1
let g:airline#extensions#default#layout=[
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
nmap <silent> <leader>tag :TagbarToggle<CR>
let g:tagbar_width = max([40, winwidth(0) * 4 / 10])
let g:tagbar_compact=1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
"====================================="

" fugitive
nmap <silent> <leader>ba :Git blame<CR>
let g:fugitive_dynamic_colors=1
"====================================="

" gitgutter
let g:gitgutter_signs=0
nmap <silent> <leader>g :GitGutterSignsToggle<CR>
"====================================="

" dash
nmap <silent> <leader>d <Plug>DashSearch
"====================================="

" rainbow pairs
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs=[
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['red',         'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=1
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

" vim-grammarous
"let g:grammarous#default_comments_only_filetypes = {
"            \ '*' : 1, 'help' : 0, 'markdown' : 0,
"            \ }
"let g:grammarous#enabled_rules = {'*' : ['PASSIVE_VOICE']}
"let g:grammarous#disabled_rules = {
"            \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES'],
"            \ 'help' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE', 'UPPERCASE_SENTENCE_START'],
"            \ }

nmap <leader>c :GrammarousCheck<CR>
let g:grammarous#enabled_categories = {'*' : ['PUNCTUATION']}
let g:grammarous#languagetool_cmd = 'languagetool'
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
endfunction
"====================================="
