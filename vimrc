"
" .vimrc
"
" Find inspiration:
" - https://github.com/rafi/vim-config
"

let mapleader = " "

call plug#begin()
    Plug 'junegunn/goyo.vim'            " Fullscreen zen: <leader>f
    Plug 'tpope/vim-commentary'         " [Un]Comment lines
                                        "    gcc        [un]comment a line
                                        "    gc<motion> [un]comment a line
                                        "    gcgc       Uncomment a block of comments
    Plug 'scrooloose/nerdtree'          " Tree browser: <leader>n
    Plug 'Xuyuanp/nerdtree-git-plugin'  " Git in nerdtree
    Plug 'tpope/vim-fugitive'           " Git stuff
    Plug 'airblade/vim-gitgutter'
    Plug 'vimwiki/vimwiki'              " Vim wiki: <leader>ww  :h vimwiki
    Plug 't9md/vim-quickhl'
    Plug 'mileszs/ack.vim'
    Plug 'junegunn/fzf.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/vim-easy-align'
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-surround'
    " Plug 'terryma/vim-multiple-cursors'
    " Plug 'kana/vim-textobj-line'
call plug#end()

syntax on
set encoding=utf-8
colorscheme "Tomorrow Night"
" colorscheme gruvbox " https://github.com/morhetz/gruvbox
"colorscheme industry
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

" Move cursor while searching and highlight all matches
" set incsearch
"set hlsearch

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Automatically delete all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" window layout
set mouse=a
set laststatus=2
set ruler
set number relativenumber
set splitbelow splitright
set scrolloff=2
set sidescrolloff=5

" Tabs/spaces
" - Change tabs to spaces :retab
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab " Soft tabs 4 spaces

" Search into subfolders with tab-completion
set path+=**

set wildmode=longest,list,full
set wildmenu " Autocompletion for :find

"
" Key bindings
" ============
"

" Switch line wrapping
noremap <c-w> :set wrap!<cr>

" Keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

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

" NERDTree. Open on no arguments or on directory. Close when it's last
map <leader>n :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



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

" Quickhl highlighting
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
" nmap <Space>m <Plug>(quickhl-manual-this-whole-word)
" xmap <Space>m <Plug>(quickhl-manual-this-whole-word)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

