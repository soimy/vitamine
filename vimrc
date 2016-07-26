" This is a su27-forked version of vimrc, inherited from:

" Vitamine {
"   Maintainer: Kaavie <mockee at gmail.com>
"   Notes: http://mockee.com
" }

" Environment {
  set nocompatible
  "filetype on
  "filetype off
  "filetype plugin indent on

  " for some env, vim has to be explicitly set to 256 colors
  let &t_Co=256
  let &t_AF="\e[38;5;%dm"
  let &t_AB="\e[48;5;%dm"
  let &t_SI="\<Esc>]50;CursorShape=1\x7"
  let &t_EI="\<Esc>]50;CursorShape=0\x7"
" }

" NeoBundles {
  if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  call neobundle#rc(expand('~/.vim/bundle/'))

  " Github Repos
  NeoBundle 'Shougo/vimproc'              " Interactive command execution
  NeoBundle 'Shougo/neocomplete'
  " NeoBundle 'Valloric/YouCompleteMe'      " Syntax auto-completion
  "NeoBundle 'scrooloose/syntastic'        " Syntax checking hacks
  NeoBundle 'scrooloose/nerdtree'         " A tree explorer plugin
  NeoBundle 'scrooloose/nerdcommenter'    " Vim plugin for intensely orgasmic commenting
  NeoBundle 'kien/ctrlp.vim'              " Fuzzy file, buffer, mru, tag, etc finder
  "NeoBundle 'myusuf3/numbers.vim'         " A vim plugin for better line numbers
  NeoBundle 'Lokaltog/vim-powerline'      " The ultimate vim statusline utility
  "NeoBundle 'ervandew/supertab'           " Perform all your vim insert mode completions with Tab
  NeoBundle 'Lokaltog/vim-easymotion'     " Vim motions on speed!
  NeoBundle 'hail2u/vim-css3-syntax'      " Add CSS3 syntax support to vim's built-in `syntax/css.vim`
  NeoBundle 'ap/vim-css-color'       " Highlight colors in css files
  "NeoBundle 'keitheis/vim-plim'           " Syntax Highlighting for Plim
  NeoBundle 'pangloss/vim-javascript'     " Vastly improved vim's javascript indentation
  NeoBundle 'plasticboy/vim-markdown'     " Syntax highlighting and matching rules for Markdown
  NeoBundle 'tpope/vim-fugitive'          " A Git wrapper so awesome, it should be illegal
  NeoBundle 'tpope/vim-surround'          " quoting/parenthesizing made simple

  " Github `vim-scripts`
  " NeoBundle 'sudo.vim'                    " Allows one to edit a file with prevledges from an unprivledged session
  NeoBundle 'ack.vim'                     " Plugin for the Perl module / CLI script 'ack'
  NeoBundle 'taglist.vim'                 " Provides an overview of the structure of source code
  NeoBundle 'SirVer/UltiSnips'                   " The ultimate snippet solution for python enabled Vim
  NeoBundle 'honza/vim-snippets'
  NeoBundle 'octol/vim-cpp-enhanced-highlight'
  NeoBundle 'davidoc/taskpaper.vim'
  NeoBundle 'Raimondi/delimitMate'
  NeoBundle 'timcharper/textile.vim'
  NeoBundle 'Shutnik/jshint2.vim'

  " Auto-Installation
  if neobundle#exists_not_installed_bundles()
    echomsg 'Automatically install the following bundles: ' .
      \ string(neobundle#get_not_installed_bundle_names())
    execute ':NeoBundleInstall'
  endif
" }

" General {
  syntax on                  " syntax highlighting
  filetype plugin indent on  " automatically detect file types
  set mouse=a                " automatically enable mouse usage
  set mousehide              " hide the mouse cursor while typing
  set encoding=utf-8
  scriptencoding utf-8
  set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

  if has ('x') && has ('gui') " on Linux use + register for copy-paste
    set clipboard=unnamedplus
  elseif has ('gui') " one mac and windows, use * register for copy-paste
    set clipboard=unnamed
  endif

  set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
  set virtualedit=onemore         " allow for cursor beyond last character
  set history=800                 " Store a ton of history (default is 20)
  set hidden                      " allow buffer switching without saving
  set autochdir                   " change directory to the current window
" }

" Formatting {
  set nowrap                      " wrap long lines
  set autoindent                  " indent at the same level of the previous line
  "set expandtab                   " tabs are spaces, not tabs
  set shiftwidth=4                " use indents of 2 spaces
  set tabstop=4                   " an indentation every two columns
  set softtabstop=4               " let backspace delete indent
  set diffopt+=iwhite,vertical    " ignore the difference of indents
  set matchpairs=(:),{:},[:]
  set foldmethod=marker
  "set colorcolumn=80
  set smartindent
  set autoindent
  set cindent

" Visible TAB
  "set list
  set listchars=tab:\|.,trail:~,extends:>,precedes:<
  nmap <f10> :set list!<CR>

" Remove trailing whitespaces and ^M chars
  autocmd BufWritePre <buffer> call StripTrailingWhitespace()
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType java setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType xml setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" }

" UI {
  set tabpagemax=15
  set background=dark

  "let g:solarized_termtrans=1
  "let g:solarized_contrast='high'
  "let g:solarized_visibility='high'
  "in mintty, comment out the following line
  "let g:solarized_termcolors=256

  colorscheme monokai
  let g:monokai_original = 1

  if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                " selected characters/lines in visual mode
  endif

  if has('statusline')
    set laststatus=2
  endif

  " set rnu                         " relative line number
  set nu
  set numberwidth=4               " set the width of line number gutter column
  "set linespace=2                 " set spaces between rows
  set ignorecase                  " case insensitive search
  set backspace=indent,eol,start  " backspace for dummies
  set smartcase                   " case sensitive when uc present
  set showmatch                   " show matching brackets/parenthesis
  set hlsearch                    " highlight search terms
  set incsearch                   " find as you type search
  "set wildmenu                    " show list instead of just completing
  "set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all
  set whichwrap=b,s,h,l,[,],<,>	  " backspace and cursor keys wrap to
  set scrolljump=5                " lines to scroll when cursor leaves screen
  set scrolloff=3                 " minimum lines to keep above and below cursor
  set foldenable                  " auto fold code
  set cursorline                  " highlight current line
  set noantialias                 " make text pretty
" }

" GUI Settings {
  if has("gui_running") || has("gui_macvim")
    set guioptions-=T           " remove the MacVim's toolbar
    if has('gui_macvim')
      set transparency=8        " Make the window slightly transparent
    endif

    if has("gui_gtk2")
      set guifont=Monaco\ 13,Consolas\ 13
    else
	  set guifont=BPmono:h13,Monaco:h13,Consolas:h13
      "set guifont=Monaco:h12,Consolas:h12
    endif
  endif
" }

" Key Mapping {
  :nnoremap <CR> :nohlsearch<CR><CR>
  map tn :tabnext<cr>
  map tp :tabprevious<cr>
  map te :tabedit
  map rn :bnext<cr>
  map rp :bprev<cr>
  map <C-j> 10j
  map <C-k> 10k

  let mapleader = ","
  let g:mapleader = ","

  " Code folding options
  nmap <leader>f0 :set foldlevel=0<CR>
  nmap <leader>f1 :set foldlevel=1<CR>
  nmap <leader>f2 :set foldlevel=2<CR>
  nmap <leader>f3 :set foldlevel=3<CR>
  nmap <leader>f4 :set foldlevel=4<CR>
  nmap <leader>f5 :set foldlevel=5<CR>
  nmap <leader>f6 :set foldlevel=6<CR>
  nmap <leader>f7 :set foldlevel=7<CR>
  nmap <leader>f8 :set foldlevel=8<CR>
  nmap <leader>f9 :set foldlevel=9<CR>

  " Easy indent for code blocks
  "nmap <tab>    v>
  "nmap <s-tab>  v<
  "vmap <tab>    >gv
  "vmap <s-tab>  <gv

  " toggle between relative and absolute numbering
  " nnoremap <F3> :NumbersToggle<CR>
" }

" NerdTree {
  map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
  map <leader>e :NERDTreeFind<CR>
  nmap <leader>nt :NERDTreeFind<CR>

  let NERDTreeShowBookmarks = 1
  let NERDTreeIgnore = ['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
  let NERDTreeChDirMode = 0
  let NERDTreeQuitOnOpen = 1
  let NERDTreeMouseMode = 2
  let NERDTreeShowHidden = 1
  let NERDTreeKeepTreeInNewTab = 1
  let g:NERDTreeWinSize = 20
  let g:nerdtree_tabs_open_on_gui_startup = 0

  " open a NERDTree automatically when vim starts up if no files were specified
  " autocmd vimenter * if !argc() | NERDTree | endif
" }

" SyntaxCheckers {
  "let g:syntastic_mode_map = {
    "\ 'mode': 'active',
    "\ 'passive_filetypes': ['html','java'] }

  " C0103:Invalid name; C0111: no doc string; W0141 map/filter
  "let g:syntastic_python_pylint_args = '-d C0103,C0111,W0141'
  "let g:syntastic_javascript_jshint_conf = '~/.jshintrc'
" }
"
" syntastic {{{
    "let g:syntastic_error_symbol='✗'
    "let g:syntastic_warning_symbol='⚠'
    "let g:syntastic_enable_highlighting = 1
    "let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
    "let g:syntastic_cpp_check_header = 1
    "let g:syntastic_cpp_no_default_include_dirs = 1
    "let g:syntastic_cpp_compiler = 'clang++'
    "let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" }}}

" vimScript {
  let g:html_indent_inctags = 'html,body,head,tbody'
  let g:html_indent_script1 = 'inc'
  let g:html_indent_style1 = 'inc'
" }

" neocomplcache {
  "let g:acp_enableAtStartup = 0
  "let g:neocomplcache_enable_at_startup = 1
  "let g:neocomplcache_enable_smart_case = 1
  "let g:neocomplcache_enable_camel_case_completion = 1
  "let g:neocomplcache_enable_underbar_completion = 1
  "let g:neocomplcache_min_syntax_length = 3
" }

" neocomplete {{{
    " "Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplete#enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

    " Disable c,cpp,cs file autocomplete
    if has('autocmd')
        autocmd FileType c,cpp,cs,python,javascript nested NeoCompleteLock
    endif
" }}}



" YouCompleteMe {
    let g:ycm_min_num_of_chars_for_completion = 1
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_complete_in_comments_and_strings = 1
    let g:ycm_add_preview_to_completeopt = 1
	"let g:ycm_key_list_select_completion = ['<C-N>', '<Down>']
    let g:ycm_key_invoke_completion = '<C-k>'
    "let g:ycm_filetype_specific_completion_to_diable = { 'cpp' : 1 }
    let g:ycm_filetype_whitelist = {
                \ 'cpp' : 1,
                \ 'c' : 1 ,
                \ 'cs' : 1,
                \ 'javascript' : 1,
                \ 'python' : 1
                \}
    set completeopt=menu,longest

    nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

    "let g:ycm_error_symbol = '✗'
    let g:ycm_error_symbol = 'X>'
    "let g:ycm_warning_symbol = '⚠'
    let g:ycm_warning_symbol = '!>'
    nmap <F4> :YcmDiags<CR>
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
    "let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_autoclose_preview_window_after_completion = 1
" }

" nerdcommenter {
  map mm <plug>NERDCommenterToggle
  map <Leader>cm NERDComMinimalComment
" }

" CtrlP {
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.pyc

  if has("gui_macvim")
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
  endif

  nmap <silent> <leader>f :CtrlP<cr>
  nmap <silent> <leader>r :CtrlPMRU<cr>
  nmap <silent> <leader>m :CtrlPMixed<cr>
" }

" Ack {
  nnoremap <leader>/ :Ack
  " The silver searcher
  " https://github.com/ggreer/the_silver_searcher
  let g:ackprg = 'ag --nogroup --nocolor --column'
" }

" CSSColor {
  let g:cssColorVimDoNotMessMyUpdatetime = 1
" }

" Fugitive {
  nnoremap <silent> <leader>st :Gstatus<CR>
  nnoremap <silent> <leader>di :Gdiff<CR>
  nnoremap <silent> <leader>bl :Gblame<CR>
  nnoremap <silent> <leader>.. :edit %:h<CR>
  nnoremap <silent> <leader>nn :cnext<CR>
  nnoremap <silent> <leader>pp :cprev<CR>
  autocmd QuickFixCmdPost *grep* cwindow
"}

" Powerline {
  let g:Powerline_symbols = 'fancy'
  "if not use patched font:
  let g:Powerline_symbols = 'compatible'
  let g:Powerline_colorscheme = 'solarized256'
" }

" EasyMotion {
  " Compatible with `solarized` colorscheme
  hi link EasyMotionTarget ErrorMsg
  hi link EasyMotionShade  Comment
" }

" UltiSnips {
	"let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
	function! g:UltiSnips_Complete()
		call UltiSnips#ExpandSnippet()
		if g:ulti_expand_res == 0
			if pumvisible()
				return "\<C-n>"
			else
				call UltiSnips#JumpForwards()
				if g:ulti_jump_forwards_res == 0
				   return "\<TAB>"
				endif
			endif
		endif
		return ""
	endfunction

	autocmd BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
    "let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsListSnippets="<c-e>"
    " this mapping Enter key to <C-y> to chose the current highlight item
    " and close the selection list, same as other IDEs.
    " CONFLICT with some plugins like tpope/Endwise
	inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" }


" Autocmd {
  autocmd! bufwritepost vimrc source ~/.vim/vimrc
" }

" Taglist {
  nmap <silent> <leader>tg :TlistToggle<CR>
  "let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
  let Tlist_File_Fold_Auto_Close=1
  let Tlist_Exit_OnlyWindow = 1
  let Tlist_Show_Menu=1
  let Tlist_GainFocus_On_ToggleOpen=1
  let Tlist_Close_OnSelect=1
  let Tlist_Compact_Format=1
  let Tlist_Use_Right_Window = 1
  let Tlist_WinWidth = 45
  let Tlist_Inc_Winwidth = 0
  let Tlist_Sort_Type = 'name'
" }

" Functions {
  function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line('.')
    let c = col('.')
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
  endfunction

  function! InitializeDirectories()
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
          \ 'backup': 'backupdir',
          \ 'views': 'viewdir',
          \ 'swap': 'directory' }

    if has('persistent_undo')
      let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
      let directory = parent . '/' . prefix . dirname . '/'
      if exists('*mkdir')
        if !isdirectory(directory)
          call mkdir(directory)
        endif
      endif
      if !isdirectory(directory)
        echo 'Warning: Unable to create backup directory: ' . directory
        echo 'Try: mkdir -p ' . directory
      else
        let directory = substitute(directory, ' ', '\\\\ ', 'g')
        exec 'set ' . settingname . '=' . directory
      endif
    endfor
  endfunction
  call InitializeDirectories()
" }

" autopep8 {
map <F8> :call FormartSrc()<CR>

func FormartSrc()
    exec "w"
    if &filetype == 'c'
    exec "!astyle --style=ansi --one-line=keep-statements -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
    exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
    exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
    exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
    exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
    exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
    exec "!astyle --style=gnu --suffix=none %"
    endif
    exec "e! %"
endfunc
" }

" cursor style {
if &term =~ '^xterm'
  let &t_SI .= "\<Esc>[5 q"
  let &t_EI .= "\<Esc>[1 q"
  " 1 or 0 -> blinking block
  " 2 -> solid underscore
  " 3 -> blinking underscore
  " 4 -> solid block
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif
" }

" ctags {
map <f12> :!~/bin/git_ctags.sh<cr>
" }

set noimdisable
autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0

"add command to complie opencv program"
nnoremap <silent><leader>2 :call CompileRunOpencv() <CR>
function! CompileRunOpencv()
    "let IncDir = "/usr/local/include"
    "let LibDir = "/usr/local/lib"
    "let Libs = "-lopencv_core -lopencv_highgui -lopencv_imgproc"
    exec "w"
    exec "lcd %:p:h"
    "exec "r !g++ -I" . IncDir . " -L" . LibDir . " % " . Libs . " -o %< "
    exec "r !g++ `pkg-config --libs --cflags opencv` -o %< "
    echo "compile finished!"
endfunc

" Auto save session and reopen
	map <F2> :mksession! ~/vim_session <cr>
	map <F3> :source ~/vim_session <cr>

