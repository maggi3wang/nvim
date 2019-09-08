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
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'lervag/vimtex'
call plug#end()

"--------------------------------------
"|              Setting               |
"--------------------------------------

syntax on
color dracula                         " Turning on the dracula theme

set tabstop=4                         " Number of visual spaces per tab
set shiftwidth=4                      " Use 4 tab spaces
" set softtabstop=4                     " Number of spaces per tab when editing
set expandtab                         " Tabs are spaces
set autoindent                        " Use autoindentation
set number                            " Show line number
set showcmd                           " Show command in bottom bar
set cursorline                        " Highlight current lineii
set showmatch                         " Show matching braces
set hlsearch                          " Highlight the last used search pattern
set incsearch                         " Show search matches as you type
set history=1000                      " Remember more commands and search history
set updatetime=100                    " Reducing updatetime for GitGutter to 100ms
filetype indent on

let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'skim'

"--------------------------------------
"|              Mappings              |
"--------------------------------------

" Turn off search highlight using \<space>
nnoremap <leader><space> :nohlsearch<CR>

" Switching between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Toggle on NERDTree using \n
map <Leader>n :NERDTreeToggle<CR>

"--------------------------------------
"|             Autocommands           |
"--------------------------------------

" Open up NERDTree by default
" autocmd VimEnter * NERDTree
" Make tabs contain mirrored NERDTree
" autocmd BufWinEnter * NERDTreeMirror
" Set window to file opened, not NERDTree
autocmd VimEnter * wincmd w

"--------------------------------------
"|         Plugin Customization       |
"--------------------------------------
let g:airline_theme='dracula'

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
