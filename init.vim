" Welcome to my neovim configuration!

"--------------------------
"|        Plugins         |
"--------------------------

" auto-install vim-plug                                                                                                                
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \                                                                  
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                             
  autocmd VimEnter * PlugInstall                                                                                                      
endif                                                                                                                                 

call plug#begin('~/.config/nvim/plugged')                                                                                             
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()

"--------------------------
"|        Settings        |
"--------------------------

syntax on
color dracula                   " Turning on the dracula theme

set tabstop=4                   " Number of visual spaces per tab
set softtabstop=4               " Number of spaces per tab when editing
set expandtab                   " Tabs are spaces
set number                      " Show line number
set showcmd                     " Show command in bottom bar
set cursorline                  " Highlight current lineii
set showmatch                   " Show matching braces
set hlsearch                    " Highlight the last used search pattern
filetype indent on

"--------------------------
"|        Mappings        |
"--------------------------

" Turn off search highlight using ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" Switching between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"--------------------------
"|      Autocommands      |
"--------------------------

" Open up NERDTree by default
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

