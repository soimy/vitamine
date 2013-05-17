# Vitamine

Vim plugins, scripts and resources for my daily use.

## Installation

1. Clone Vitamine:
  ```bash
  $ git clone git@github.com:su27/vitamine.git ~/.vim
  ```

3. Create link
  ```bash
    echo source ~/.vim/vimrc > ~/.vimrc
  ```

2. Fetch submodule - NeoBundle:
  ```bash
  $ cd ~/.vim && git submodule init && git submodule update
  ```

3. Launch MacVim or Vim, plugins and scripts will be installed automatically.

4. Download & install patched font Monaco for Vim-Powerline. [OSX](https://gist.github.com/1838072) / [Linux](https://gist.github.com/1634235)

## Configured Bundles:

```viml
" NeoBundles {
  " Github Repos
  NeoBundle 'Shougo/vimproc'              " Interactive command execution
  "NeoBundle 'Shougo/neocomplcache'        " Ultimate auto-completion system
  NeoBundle 'scrooloose/syntastic'        " Syntax checking hacks
  NeoBundle 'scrooloose/nerdtree'         " A tree explorer plugin
  NeoBundle 'scrooloose/nerdcommenter'    " Vim plugin for intensely orgasmic commenting
  NeoBundle 'kien/ctrlp.vim'              " Fuzzy file, buffer, mru, tag, etc finder
  NeoBundle 'myusuf3/numbers.vim'         " A vim plugin for better line numbers
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
  NeoBundle 'taglist.vim'                 " Provides an overview of the structure of source code
  NeoBundle 'UltiSnips'                   " The ultimate snippet solution for python enabled Vim
" }
```
