set nocompatible
if has("autocmd")
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
          filetype plugin indent on
            " ...
endif

let g:airline#extensions#tabline#enabled = 1

execute pathogen#infect()
set rtp+=/home/lerner/.vim/bundle/powerline/bindings/vim
nnoremap :gun :GundoToggle<CR>

set showmatch
set undofile
set undodir=$HOME/.vim/undodir


set expandtab         "turn tabs into spaces
set smarttab          "helps with backspacing after tab
set tabstop=2
set shiftwidth=2

set nojoinspaces

set colorcolumn=80

map \\\ :w<Enter>
map ;; :s//g<Left><Left>
map ;g; :%s//g<Left><Left>
map <Tab> :bn<Enter>

map <leader>cd :cd %:p:h<cr>

if has("autocmd")
    " Helps if you have to use another editor on the same file
    au FileChangedShell * Warn "File has been changed outside of Vim."
endif

" Folding (spacebar toggles) {{{
" Spacebar toggles a fold, zi toggles all folding, zM closes all folds
noremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

" Window layout
set showmode
set cursorline
set showmode
set scrolloff=1
set laststatus=2
set noshowmode
set ttyfast

"to fix the font and lot of strange characters and colors
"set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\

au BufNewFile,BufRead *.hx            setf haxe
au BufNewFile,BufRead *.hx            set smartindent

"Bind C-n to noh to remove highlighting
noremap <silent> <C-N> :silent noh<CR>:w

"Searching - search incrementally, highlight search results,
"ignore case, but don't ignore it if there are uppercase letters involved
set ignorecase
set smartcase
set incsearch
set hlsearch

map <leader>lw :set nowrap! <CR>

"better highlighting and colors for dark background
set background=dark

set directory^=$HOME/.vim_swap//    "put all swap files together

let @b='A {}kki     '

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END

set wildmenu
"repeat visual mode selections
vnoremap . :normal .<cr>  
set relativenumber
