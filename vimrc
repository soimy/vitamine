" Vitamine {
"   Maintainer: Kaavie <mockee at gmail.com>
"   Notes: http://mockee.com
" }

" Environment {
  set nocompatible
  filetype on
  filetype off
  filetype plugin indent on
" }

" NeoBundles {
  if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  call neobundle#rc(expand('~/.vim/bundle/'))

  " Github Repos
  NeoBundle 'Shougo/vimproc'              " Interactive command execution
  "NeoBundle 'Shougo/neocomplcache'        " Ultimate auto-completion system
  NeoBundle 'scrooloose/syntastic'        " Syntax checking hacks
  NeoBundle 'scrooloose/nerdtree'         " A tree explorer plugin
  NeoBundle 'scrooloose/nerdcommenter'    " Vim plugin for intensely orgasmic commenting
  NeoBundle 'kien/ctrlp.vim'              " Fuzzy file, buffer, mru, tag, etc finder
  "NeoBundle 'myusuf3/numbers.vim'         " A vim plugin for better line numbers
  NeoBundle 'Lokaltog/vim-powerline'      " The ultimate vim statusline utility
  "NeoBundle 'ervandew/supertab'           " Perform all your vim insert mode completions with Tab
  NeoBundle 'hail2u/vim-css3-syntax'      " Add CSS3 syntax support to vim's built-in `syntax/css.vim`
  NeoBundle 'skammer/vim-css-color'       " Highlight colors in css files
  NeoBundle 'pangloss/vim-javascript'     " Vastly improved vim's javascript indentation
  NeoBundle 'tpope/vim-fugitive'          " A Git wrapper so awesome, it should be illegal
  NeoBundle 'tpope/vim-surround'          " quoting/parenthesizing made simple

  " Github `vim-scripts`
  " NeoBundle 'sudo.vim'                    " Allows one to edit a file with prevledges from an unprivledged session
  NeoBundle 'ack.vim'                     " Plugin for the Perl module / CLI script 'ack'
  NeoBundle 'EasyMotion'                  " Vim motions on speed!

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
  "set mouse=a                " automatically enable mouse usage
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
  "set autochdir                   " change directory to the current window
" }

" Formatting {
  set nowrap                      " wrap long lines
  set autoindent                  " indent at the same level of the previous line
  set expandtab                   " tabs are spaces, not tabs
  set shiftwidth=4                " use indents of 2 spaces
  set tabstop=4                   " an indentation every two columns
  set softtabstop=4               " let backspace delete indent
  set diffopt+=iwhite,vertical    " ignore the difference of indents
  set matchpairs=(:),{:},[:],<:>
  set foldmethod=marker
  set colorcolumn=80
  set smartindent
  set autoindent
  set cindent

  " Remove trailing whitespaces and ^M chars
  autocmd BufWritePre <buffer> call StripTrailingWhitespace()
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" }

" UI {
  set tabpagemax=15
  set background=dark

  if has('gui_macvim')
    colorscheme macvim
  else
    let g:solarized_termcolors=256
    colorscheme solarized
	  "colorscheme molokai
  endif

  let g:solarized_termtrans=1
  let g:solarized_contrast='high'
  let g:solarized_visibility='high'

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
  set linespace=2                 " set spaces between rows
  set ignorecase                  " case insensitive search
  set backspace=indent,eol,start  " backspace for dummies
  set smartcase                   " case sensitive when uc present
  set showmatch                   " show matching brackets/parenthesis
  set hlsearch                    " highlight search terms
  set incsearch                   " find as you type search
  set wildmenu                    " show list instead of just completing
  set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all
  set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
  set scrolljump=5                " lines to scroll when cursor leaves screen
  set scrolloff=3                 " minimum lines to keep above and below cursor
  set foldenable                  " auto fold code
  " set cursorline                  " highlight current line
  set anti                        " make text pretty
" }

" GUI Settings {
  if has("gui_running") || has("gui_macvim")
    set guioptions-=T           " remove the MacVim's toolbar
    if has('gui_macvim')
      set transparency=5        " Make the window slightly transparent
    endif

    if has("gui_gtk2")
      set guifont=Monaco\ 13,Consolas\ 13
    else
      set guifont=Monaco:h13,Consolas:h13
    endif
  endif
" }

" Key Mapping {
  " map <F10> :VSTreeExplore<cr>
  :nnoremap <CR> :nohlsearch<CR><CR>
  map tn :tabnext<cr>
  map tp :tabprevious<cr>
  map te :tabedit
  map tj 10j
  map tk 10k
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
  nmap <tab>    v>
  nmap <s-tab>  v<
  vmap <tab>    >gv
  vmap <s-tab>  <gv

  nnoremap / /\v
  vnoremap / /\v

  " clearing highlighted search
  nmap <silent> <leader><space> :nohlsearch<CR>

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
  autocmd vimenter * if !argc() | NERDTree | endif
" }

" SyntaxCheckers {
  let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'passive_filetypes': ['html'] }

  let g:syntastic_python_checker = 'flake8'
  let g:syntastic_python_checker_args = '--ignore="E401,E501"'
  let g:syntastic_javascript_jshint_conf = '~/.jshintrc'
" }

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

" nerdcommenter {
  map mm <plug>NERDCommenterToggle
" }

" CtrlP {
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

  set wildignore+=*/tmp/*,*.so,*.swp,*.zip

  if has("gui_macvim")
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
  endif

  nmap <silent> <leader>t :CtrlP<cr>
  nmap <silent> <leader>r :CtrlPMRU<cr>
" }

" Ack {
  nnoremap <leader>/ :Ack
" }

" CSSColor {
  let g:cssColorVimDoNotMessMyUpdatetime = 1
" }

" Fugitive {
  nnoremap <silent> <leader>st :Gstatus<CR>
  nnoremap <silent> <leader>di :Gdiff<CR>
  nnoremap <silent> <leader>bl :Gblame<CR>
  autocmd QuickFixCmdPost *grep* cwindow
"}

" Powerline {
  let g:Powerline_symbols = 'fancy'
  let g:Powerline_colorscheme = 'solarized256'
" }

" EasyMotion {
  let g:EasyMotion_leader_key = '<Leader>'

  " Compatible with `solarized` colorscheme
  hi link EasyMotionTarget ErrorMsg
  hi link EasyMotionShade  Comment
" }

" Autocmd {
  autocmd! bufwritepost vimrc source ~/.vim/vimrc
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

" for diff {
  if &diff
      colorscheme slate
  endif

  hi DiffAdd term=reverse cterm=bold ctermbg=lightgreen ctermfg=0
  hi DiffChange term=reverse cterm=bold ctermbg=white ctermfg=0
  hi DiffText term=reverse cterm=bold ctermbg=gray ctermfg=0
  hi DiffDelete term=reverse cterm=bold ctermbg=lightred ctermfg=0
" }


highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline

