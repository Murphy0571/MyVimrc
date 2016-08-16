"--display--
set nu! "show num of line  
set nowrap  
set linebreak "do not break a word
set encoding=utf-8
set nocompatible " be iMproved, required
set cursorline

"--leader key mapping--
let mapleader = ","

"--syntax enabled and on--
syntax enable
syntax on
colorscheme desert 


"--set tab width 4--
set shiftwidth=4
set tabstop=4
set expandtab

"--search and replace--
set hlsearch  
set incsearch ""quick search when part of string is input 

"-- grep for vim--
nnoremap <silent> <F4> Grep <CR>

"--MiniBufferExplorer--
"  How do we delete one buffer/tab while keep others alive?
"  Just <c-k> to navigate to upper MBE zone and (probably type 
"  'tab' to navigate between buffer/tabs)type 'd' to delete the
"  buffer/tab. Then use <c-j> to navigate back.
let g:miniBufExplMapWindowNavVim= 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
map <c-n> :bn<CR>"ctrl-n next buffer
map <c-m> :bp<CR>"ctrl-m previous buffer

"--Vundle setup--
" set the runtime path to include Vundle and initialize
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
"--end of Vundle setup--


"--auto completion--
filetype plugin indent on
set completeopt=longest,menu

"--NERDTree config--
autocmd vimenter * NERDTree"auto-open NERDTree when vim is opened...
map <c-e> :NERDTreeToggle<CR>"ctrl-e to toggle NERDTree       
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif " close NERDTree if all docs closed except nerdtree...
"let NERDTreeShowHidden=1
" Disabled auto-show in NERDTree, use shift-i to show/unshow hidden
" files/folders.
"Note, <Leader>w can be used to auto-adjust NERDTree window width aligning with the longest file name, by adding .vim/plugin/toggle_width.vim

"--Tagbar config--
nmap <F2> :TagbarToggle<CR>

"--switch between .h and .c(c,pp), using a.vim--
nnoremap <silent> <F3> :A<CR> 

"--YCM config for Android dev--

" let YCM can also auto-complete in comments and strings.
let g:ycm_complete_in_comments_and_strings=1

" We can use ctrl-j/ctrl-k or down/up-arrow to navigate down/up the select list when
" auto-complete list is prompted.
let g:ycm_key_list_select_completion= ['<c-j>','<Down>']
let g:ycm_key_list_previous_completion= ['<c-k>','<Up>']

" Auto close preview window after completion.
let g:ycm_autoclose_preview_window_after_completion = 1

" No need to extra-confirm for loading extra_conf.
let g:ycm_confirm_extra_conf=0

" GoTo definition/declaration command. Basically
" GoToDefinitionElseDeclaration is good enough to use...
" How do we get back from definition/declaration? 
" Just use ctrl-o to come back and ctrl-i to go
" This is Vim's default tab jump method:)
nnoremap <Leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Way to extra_conf file for Android.
if getcwd() =~ "kernel"
    let g:ycm_global_ycm_extra_conf='~/ycm_extra_conf_kernel.py'
else
    let g:ycm_global_ycm_extra_conf='~/ycm_extra_conf.py'
endif

"--End of YCM config for Android dev--






