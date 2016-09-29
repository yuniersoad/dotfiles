set nocompatible number hlsearch              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'derekwyatt/vim-scala'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set foldmethod=syntax
set t_Co=256

let mapleader=","

:map <Leader>( i(<Esc>ea)<Esc>
:map <Leader>) a)<Esc>bi(<Esc>


:map <Leader>" i"<Esc>ea"<Esc>
:map <Leader>' i'<Esc>ea'<Esc>

:nmap <leader>Q :copen<cr>
:nmap <leader>qn :cnext<cr>
:nmap <leader>qp :cprev<cr>
:nmap <leader>qc :cclose<cr>

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

set ignorecase
set autowrite
set backspace=indent,eol,start

" => Nerd Tree
"
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" => Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go']

" airline won't display without this
set laststatus=2

" => Golang
let g:go_list_type = "quickfix"
au Filetype go nnoremap <leader>r :GoRun %<CR>
au Filetype go nnoremap <leader>t :GoTest<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

