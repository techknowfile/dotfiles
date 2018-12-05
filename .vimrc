set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" General VIM Configuration
setlocal conceallevel=0
set conceallevel=0
set rnu
set nu
set incsearch
set breakindent
set autochdir
let mapleader="\<Space>"
map <leader>s :source /home/techknowfile/.vimrc<CR>
set tabstop=4
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set lazyredraw
set ttyfast

" Install/Run Plugins
call plug#begin('~/.vim/tmpplugged')
    Plug 'vim-latex/vim-latex'
    Plug 'ayu-theme/ayu-vim'
    Plug 'Yggdroot/indentLine'
    Plug 'PontusPersson/pddl.vim'
    " Plug 'kien/ctrlp.vim'
    Plug 'xuhdev/vim-latex-live-preview'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'ervandew/supertab'
    function! BuildYCM(info)
        if a;info.status == 'installed' || a:info.force
            !./install.sh
        endif
    endfunction
    Plug 'Valloric/YouCompleteMe'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'davidhalter/jedi-vim'
    Plug 'w0rp/ale'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'tpope/vim-ragtag'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'hdima/python-syntax'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'vimwiki/vimwiki'
    Plug 'bfredl/nvim-ipy'

    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-line'
    Plug 'kana/vim-textobj-entire'
    Plug 'bps/vim-textobj-python'
    Plug 'rbonvall/vim-textobj-latex'
	Plug 'parkr/vim-jekyll'
    Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'https://github.com/Alok/notational-fzf-vim'
call plug#end()

" notational fzf
let g:nv_search_paths = ['~/notes', './notes.md']

" Shortcuts
inoremap jk <esc>
tnoremap jk <C-\><C-n>
vnoremap jk <esc>
vnoremap kj <esc>
tnoremap kj <C-\><C-n>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-g>g :Ag<CR>
nnoremap <C-g>c :Commands<CR>
nnoremap <C-f>l :BLines<CR>
nnoremap <C-p> :Files<CR>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<CR>

" Buffer Configuration
set hidden

au BufNewFile,BufRead *.md
	\ set textwidth=72 | 
	\ set formatoptions+=t


" LaTeX Settings
let g:tex_flavor='latex'
set updatetime=1000
let g:livepreview_previewer = 'zathura'
:onoremap <silent> i$ :<c-u>normal! T$vt$<cr>
:vnoremap i$ T$ot$
let g:Tex_DefaultTargetFormat='pdf'
au BufNewFile,BufRead *.tex
    \ filetype indent on |
    \ filetype plugin on |
    \ let g:tex_flavor="latex" 
" SyncTex support
function! Synctex()
        " remove 'silent' for debugging
        execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction
map <C-enter> :call Synctex()<cr>


"Python
" autocmd FileType python BracelessEnable +indent

" Python REPL
map <silent> <C-s> <Plug>(IPy-Run)
let g:nvim_ipy_perform_mappings = 1
" map <leader>p :IronRepl<CR>jkG:resize 10<CR>:set nonu<CR>:set nornu<CR><C-w><C-w>
nnoremap <leader>p :IPython<CR><C-w><C-w>:resize 10<CR>:set nonu<CR>:set nornu<CR>:set winfixheight<CR><C-w><C-w>
function! Ipython_prompt()
    let user_cmd = input('')
    call IPyRun(user_cmd)
endfunction
nmap <leader>f :call Ipython_prompt()<CR>

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" Color Scheme
" set t_8f=[38;2;%lu;%lu;%lum
" set t_8b=[48;2;%lu;%lu;%lum
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_italic = 1
let g:monokai_term_italic = 1
let g:monokai_term_bold = 1
let g:solarized_termcolors = 256
set background=dark
let ayucolor="dark"
colorscheme gruvbox
" let g:indentLine_char = ''
" let g:indentLine_first_char = ''
" let g:indentLine_showFirstIndentLevel = 0
" let g:indentLine_setColors = 1
