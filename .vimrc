
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Gruvbox colors: 
syn on
set t_Co=256
colorscheme gruvbox " https://github.com/morhetz/gruvbox
"colorscheme industry

" Window layout
set number
set relativenumber
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab " Soft tabs 4 spaces
set mouse=a " Mouse support"

"
" Key bindings
" ============

let mapleader = " "

" Quick save & exit
noremap <Leader>s :update<CR>
noremap <Leader>q :update<cr>:q<CR>

" Tabs
noremap <Leader>t :tabnew<CR>
noremap <C-J> :tabprevious<CR>
noremap <C-K> :tabnext<CR>

"
" Other config
" ============

" Invisible characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
noremap <Leader>i :set list!<cr>

" Help File speedups
au filetype help nnoremap <buffer>q :q<CR>
au filetype help set nonumber
au filetype help wincmd _ " Maximze the help on open
set splitbelow " Split windows, ie Help, make more sense to me below

