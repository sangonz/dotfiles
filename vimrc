"
" .vimrc
"

let mapleader = " "

call plug#begin()
    Plug 'junegunn/goyo.vim'
    Plug 'tpope/vim-commentary'
        " gcc        [un]comment a line
        " gc<motion> [un]comment a line
        " gcgc       Uncomment a block of comments
    Plug 'terryma/vim-multiple-cursors'
    " Plug 'kana/vim-textobj-line'
call plug#end()

syntax on
set encoding=utf-8
colorscheme gruvbox " https://github.com/morhetz/gruvbox
"colorscheme industry
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

" Move cursor while searching and highlight all matches
set incsearch
"set hlsearch

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Automatically delete all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" window layout
set mouse=a " mouse support
set laststatus=2
set ruler
set number relativenumber
set splitbelow splitright
set scrolloff=2
set sidescrolloff=5
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab " Soft tabs 4 spaces

set wildmode=longest,list,full
set wildmenu " Autocompletion for :find

"
" Key bindings
" ============

" Natural indentation
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_

" Move blocks/lines of text
nnoremap <s-j> :m .+1<cr>==
nnoremap <s-k> :m .-2<cr>==
vnoremap <s-j> :m '>+1<cr>gv=gv
vnoremap <s-k> :m '<-2<cr>gv=gv

" Quick save & exit
noremap <leader>s :update<cr>
noremap <leader>w :update<cr>
noremap <leader>q :q<cr>
noremap <leader>wq :update<cr>:q<cr>

" Tabs
noremap <leader>t :tabnew<cr>
noremap <C-j> :tabprevious<cr>
noremap <C-k> :tabnext<cr>

" Goyo - fullscreen mode
noremap <leader>f :Goyo<cr>


" Mac specific
"noremap


"
" Other config
" ============

" Invisible characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
noremap <leader>i :set list!<cr>

" Help File speedups
au filetype help wincmd _ " Maximze the help on open
au filetype help nnoremap <buffer>q :q<cr> " Only press q to exit help
au filetype help set nonumber


