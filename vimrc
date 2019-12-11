"
" .vimrc
"
" Find inspiration:
" - https://github.com/rafi/vim-config
"

let mapleader = " "

call plug#begin()
    Plug 'junegunn/goyo.vim'            " Fullscreen zen: <leader>f
    Plug 'tpope/vim-commentary'         " [Un]Comment lines: gcc (line), gcgc (block)
    Plug 'scrooloose/nerdtree'          " Tree browser: <leader>n
    Plug 'Xuyuanp/nerdtree-git-plugin'  " Git in nerdtree
    Plug 'tpope/vim-fugitive'           " Git stuff
    Plug 'airblade/vim-gitgutter'       " Git changes in left margin
    Plug 'vimwiki/vimwiki'              " Vim wiki: <leader>ww  :h vimwiki
    Plug 't9md/vim-quickhl'             "
    Plug 'mileszs/ack.vim'              " Search in all files. :Ack text
    Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
    Plug 'junegunn/fzf.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-surround'           " Quotes/(t)ags: cs"', ysiw', cst<p>, VS<p>
    Plug 'dhruvasagar/vim-table-mode'   " Talbe mode: :TableModeToggle, <leader>tm
    Plug 'vim-airline/vim-airline'
    Plug 'moll/vim-bbye'                " Handle buffer closing properly: <leader>q
    " Plug 'powerline/powerline'
    " Plug 'terryma/vim-multiple-cursors'
    " Plug 'kana/vim-textobj-line'
    Plug 'morhetz/gruvbox'              " Color scheme
call plug#end()

syntax on
set encoding=utf-8
"colorscheme industry
" silent! colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
silent! colorscheme gruvbox " https://github.com/morhetz/gruvbox
set bg=dark
" colorscheme Tomorrow-Night

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

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"
" Key bindings
" ============
"

" Quick save & exit
noremap <leader>w :wa<cr>
noremap <leader>s :wa<cr>
noremap <leader><s-q> :xa<cr>

" Split navigations
" nnoremap <c-j> <c-w><c-j>
" nnoremap <c-k> <c-w><c-k>
" nnoremap <c-l> <c-w><c-l>
" nnoremap <c-h> <c-w><c-h>
nmap <c-w>+ <c-w>+<SID>ws
nmap <c-w>- <c-w>-<SID>ws
nn <script> <SID>ws+ <c-w>+<SID>ws
nn <script> <SID>ws- <c-w>-<SID>ws
nmap <SID>ws <Nop>

" Buffers
:nnoremap <Leader>q :Bdelete<CR>
map <leader>j :bn<cr>
map <leader>k :bp<cr>

" Switch line wrapping
" noremap <c-w> :set wrap!<cr>

" Keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" Move blocks/lines of text
nnoremap <s-j> :m .+1<cr>==
nnoremap <s-k> :m .-2<cr>==
vnoremap <s-j> :m '>+1<cr>gv=gv
vnoremap <s-k> :m '<-2<cr>gv=gv

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


"
" Table mode
" ==========
"

" Auto-start table mode on || or __ : :TableModeToggle or <leader>tm
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

