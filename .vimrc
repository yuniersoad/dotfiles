set nocompatible number hlsearch
syntax on 
set foldmethod=syntax

let mapleader=","

:map <Leader>( i(<Esc>ea)<Esc>
:map <Leader>) a)<Esc>bi(<Esc>


:map <Leader>" i"<Esc>ea"<Esc>
:map <Leader>' i'<Esc>ea'<Esc>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" => Nerd Tree
"
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

