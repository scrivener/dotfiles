:set expandtab
:set tabstop=4
:set shiftwidth=4
:set incsearch
:set hlsearch

:map \\\ :w<Enter>
:map ;; :s//g<Left><Left>
:map ;g; :%s//g<Left><Left>
:map <Tab> :bn<Enter>

"Bind C-n to noh to remove highlighting
:noremap <silent> <C-N> :silent noh<CR>:w

"ignore case, but don't ignore it if there are uppercase letters involved
:set ic   
:set scs 

"better highlighting and colors for dark background
:set background=dark

set directory^=$HOME/.vim_swap//    "put all swap files together

let @b='A {}kki     '
if has("autocmd")
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
          filetype plugin indent on
            " ...
endif

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END
