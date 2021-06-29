set scrolloff=8
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

call plug#begin('~/.vim/plugged')
"telescope plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Theme
Plug 'ayu-theme/ayu-vim'
"Airline adds usefull load bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"NerdTree allows you to see a file tree
Plug 'preservim/nerdtree'
"Float terminal
Plug 'voldikss/vim-floaterm'
"Adds ranbow brackets
Plug 'frazrepo/vim-rainbow'
"I think this is useless
"Plug 'mattn/emmet-vim'
"I dont remember what plugin this is
Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'
Plug 'hrsh7th/nvim-compe'
"Auto completion and auto close brackets
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'townk/vim-autoclose'
"Git show changes
Plug 'airblade/vim-gitgutter'
Plug 'rakr/vim-one'
"Gruv box
Plug 'morhetz/gruvbox'

call plug#end()
set termguicolors     " enable true colors support
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

colorscheme gruvbox 
set background=dark " for the dark version
" set background=light " for the light version
let g:airline_theme='gruvbox'


let mapleader = " "

nnoremap <leader>pv :Vex<CR>
nnoremap <leader>f <cmd>Telescope file_browser<cr>
nnoremap <leader>a <C-w>h
nnoremap <leader>d <C-w>l
nnoremap <leader>s <C-w>j
nnoremap <leader>w <C-w>k
inoremap kj <Esc>
noremap <leader>1 :w<CR>
noremap <leader>r <C-^>
nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11
nnoremap <C-x> :!g++ -o  %:r.out % -std=c++11<CR> <bar>:FloatermNew %:r.out<CR>

"Coc snippets remap to tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'
"End of Coc remap
