" Welcome to my neovim configuration!

"-------------------------------------
"|              Plugins              |
"-------------------------------------

" auto-install vim-plug                                                                                                                
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \                                                                  
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                             
  autocmd VimEnter * PlugInstall                                                                                                      
endif                                                                                                                                 

call plug#begin('~/.config/nvim/plugged')                                                                                             
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

"--------------------------------------
"|              Setting               |
"--------------------------------------

syntax on
color dracula                         " Turning on the dracula theme
set guifont=Monaco:h13                " Use Menlo size 13 font

set tabstop=4                         " Number of visual spaces per tab
set softtabstop=4                     " Number of spaces per tab when editing
set expandtab                         " Tabs are spaces
set number                            " Show line number
set showcmd                           " Show command in bottom bar
set cursorline                        " Highlight current lineii
set showmatch                         " Show matching braces
set hlsearch                          " Highlight the last used search pattern
filetype indent on

"--------------------------------------
"|              Mappings              |
"--------------------------------------

" Turn off search highlight using ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" Switching between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <Leader>n :NERDTreeToggle<CR>

"--------------------------------------
"|             Autocommands           |
"--------------------------------------

" Open up NERDTree by default
autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror
autocmd VimEnter * wincmd w

"--------------------------------------
"|         Plugin Customization       |
"--------------------------------------
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
