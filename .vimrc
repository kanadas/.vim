" ---------------------- USABILITY CONFIGURATION ----------------------
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting
" don't make vim compatible with vi 
set nocompatible
syntax on
set number
set relativenumber
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on
set autoread         
set encoding=utf-8
set fileencoding=utf-8
"set mouse=a
set autoindent

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw

" map pl spellchecking to <F6>
map <F6> :set spell! spelllang=pl<CR>
map <F7> :set spell! spelllang=en<CR>

au BufRead,BufNewFile *.asm set filetype=nasm

" Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" ---------------------- PLUGIN CONFIGURATION ----------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin definitions:
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'cosminadrianpopescu/vim-sql-workbench'
" end plugin definitions
call vundle#end()            " required
filetype plugin indent on    " required

"YCM congiguration
let g:ycm_global_ycm_extra_conf = '~/.vim/global_ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

" start NERDTree on start-up and focus active window
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntastic recommended configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Diable syntastic for java, because i have YCM
let g:syntastic_java_checkers = []

" Syntastic asm configuration
let g:syntastic_nasm_checkers = ['nasm']
let g:syntastic_nasm_nasm_args = ['-f elf64']

" vimtex configuration
" default compiler is latexmk
"let g:vimtex_compiler_method = 'latexrun'
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

"CtrlP and SQLWorkbech confit
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:sw_exe = '/opt/SQLWorkbench/sqlwbconsole.sh'
let g:ctrlp_extensions = ['sw_profiles']
let g:sw_config_dir = '/home/tkanas/.sqlworkbench'
