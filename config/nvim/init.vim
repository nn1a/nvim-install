call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'tpope/vim-abolish'
Plug 'Lokaltog/vim-easymotion'
Plug 'ronakg/quickr-cscope.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

call plug#end()

"============CoC setting======================
"" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
          let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <Tab>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<Tab>" :
          \ coc#refresh()

colorscheme dracula
set autoindent
set cindent
set smartindent
set tabstop=4
set shiftwidth=4
set number
set ruler
set title
set wrap
set cursorline
set background=dark
set linebreak
set showmatch
set guicursor=
set mouse=r
set laststatus=2
if !has('gui_running')
    set t_Co=256
endif

"" nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

"" Ctrl p ignore list
let g:ctrlp_custom_ignore = {
                        \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$\|node_modules$',
                        \ 'file': '\v\.(exe|so|dll)$'
                        \ }

set encoding=UTF-8

"" easir window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"" ctag Tagbar
nnoremap <silent> <C-K><C-T> :TagbarToggle<CR>
