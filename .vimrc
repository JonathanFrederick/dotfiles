"command Log colorscheme elflord | %s/\//g | AnsiEsc
" auto-install vim-plug

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'pacokwon/onedarkhc.vim'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}


call plug#end()

set shell=bash\ -i
set ruler

filetype plugin on

" search for selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

 
