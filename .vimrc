set clipboard^=unnamed
set swapfile
set t_Co=256
set backupdir=~/.vim_bak//
set directory=~/.vim_tmp//
" let g:ctrlp_show_hidden=1

let mapleader="\<Space>"
set nocompatible
" filetype off
call plug#begin('~/.vim/plugged')

" Add plugins here
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/nerdtree'
function! BuildYCM(info)
    if a;info.status == 'installed' || a:info.force
        !./install.sh
    endif
endfunction
" Plug 'vim-scriptsnilatex.vim'
Plug 'mboughaba/i3config.vim'
Plug 'easymotion/vim-easymotion'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-ruby/vim-ruby'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'alvan/vim-closetag'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'vim-latex/vim-latex'
Plug 'vimwiki/vimwiki'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/LustyJuggler'
Plug 'morhetz/gruvbox'
Plug 'ivanov/vim-ipython'
Plug 'tweekmonster/braceless.vim'
Plug 'PontusPersson/pddl.vim'
Plug 'sickill/vim-monokai'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
" end plugins
call plug#end()

"YCM
""Django
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

"Vim-airline
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#left_sep=''
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_skip_empty_sections=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"set layout
set background=dark
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox

set incsearch
set path+=**
set tabstop=4
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
" filetype indent on
filetype plugin indent on
set cursorline
nnoremap <leader>h :set hls!<CR>
set wildmenu
syntax enable
map <leader>s :source ~/.vimrc<CR>
map <leader>n :NERDTreeToggle<CR>
:inoremap jk <esc>
:vnoremap jk <esc>
:vnoremap kj <esc>
set breakindent
" set noautoindent
set laststatus=2
set noshowmode
set expandtab
" this enables "visual" wrapping
set wrap
autocmd FileType python BracelessEnable +indent
" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0
let g:Tex_DefaultTargetFormat='pdf'
au BufWritePost *.tex silent call Tex_RunLaTeX()
au BufWritePost *.tex silent !pkill -USR1 xdvi.bin
au BufNewFile,BufRead *.tex
    \ filetype indent on |
    \ filetype plugin on |
    \ let g:tex_flavor="latex" 


function SetXeTex()
    let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 -src-specials -interaction=nonstopmode $*'
endfunction
map <Leader>lx :<C-U>call SetXeTex()<CR>
let g:Tex_IgnoredWarnings = 
    \"Font shape"."\n".
    \"LaTeX Font Warning"."\n".
    \"Underfull"."\n".
    \"Size substitutions"."\n"
let g:Tex_IgnoreLevel = 4

" augroup filetypedetect

"     au BufNewFile,BufRead *.world
"         \set filetype=xml  

" augroup END
au BufNewFile,BufRead *.launch,*.world 
    \set filetype=xml  

au BufNewFile,BufRead *.py
    \ set tabstop=4        |
    \ set softtabstop=4    |
    \ set shiftwidth=4     |
    \ set expandtab        |
    \ set autoindent      |
    \ set fileformat=unix  

au BufNewFile,BufRead *.js, *.html, *.css, *.jsp
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

set relativenumber
set number

no <down> <Nop>
no <up> <Nop>
no <left> <Nop>
no <right> <Nop>

ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>

let g:ragtag_global_maps=1
"vim-airline settings
let g:airline#extensions#tabline#fnamemod = ':t'

" Shortcut keys
nnoremap <F5> "=strftime("%a %b %d, %Y")<CR>P
inoremap <F5> <C-R>=strftime("%a %b %d, %Y")<CR>

"allow switching of buffers without save
:set hidden

"VimWiki settings
let g:vimwiki_list_ignore_newline = 0
map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3
let g:vimwiki_list = [{'path': '~/vimwiki', 'template_path': '~/vimwiki/templates/',
          \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md',
          \ 'path_html': '~/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown',
          \ 'template_ext': '.tpl'}]

let g:AutoPairsMapCR = 0
let g:AutoPairsShortcutJump = "<C-n>"
let g:AutoPairsNormalJump = 0
