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
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'tmux-plugins/tpm'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

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
set clipboard+=unnamedplus            " Enabling cp btwn files
filetype indent on

set mouse=a

let g:tex_flavor  = 'latex'
let g:vimtex_quickfix_mode=0
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-pdflatex="xelatex --shell-escape %O %S"',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ]
    \}

let g:vimtex_view_method = "skim"
let g:vimtex_view_general_viewer
		\ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
	if !a:status | return | endif

	let l:out = b:vimtex.out()
	let l:tex = expand('%:p')
	let l:cmd = [g:vimtex_view_general_viewer, '-r']
	if !empty(system('pgrep Skim'))
	call extend(l:cmd, ['-g'])
	endif
	if has('nvim')
	call jobstart(l:cmd + [line('.'), l:out, l:tex])
	elseif has('job')
	call job_start(l:cmd + [line('.'), l:out, l:tex])
	else
	call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
	endif
endfunction<Paste>

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

set conceallevel=1
let g:tex_conceal='abdmg'

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
autocmd VimEnter * NERDTree
" Make tabs contain mirrored NERDTree
autocmd BufWinEnter * NERDTreeMirror
" Set window to file opened, not NERDTree
autocmd VimEnter * wincmd w

"--------------------------------------
"|         Plugin Customization       |
"--------------------------------------
" colorscheme dracula
" let g:airline_theme='dracula'
" set -g @plugin 'sei40kr/tmux-airline-dracula'


" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! StdinReadPre * let s:std_in=1
autocmd! BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeShowHidden=1
let g:NERDTreeShowIgnoredStatus=1
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

set modifiable

" nerdtree-tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:nerdtree_tabs_open_on_console_startup=1


