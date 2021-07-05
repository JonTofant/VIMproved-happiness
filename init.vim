set scrolloff=8
set number relativenumber
set nu rnu
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
Plug 'neoclide/coc.nvim',{'do': { -> coc#util#install()}} 
Plug 'townk/vim-autoclose'
"Git show changes
Plug 'airblade/vim-gitgutter'
Plug 'rakr/vim-one'
"Gruv box
Plug 'morhetz/gruvbox'
"Startify changes first screen
Plug 'mhinz/vim-startify'
"Allows me to f find things across multiple lines
Plug '/chrisbra/improvedft'
"Dracula colorscheme
Plug 'dracula/vim'
"Nord colorscheme
Plug 'arcticicestudio/nord-vim'
Plug 'tibabit/vim-templates'
Plug'/honza/vim-snippets'
Plug'puremourning/vimspector'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()
set termguicolors     " enable true colors support
"let ayucolor="dark"   " for dark version of theme

"colorscheme uyu
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark " for the dark version
" set background=light " for the light version
let g:airline_theme='gruvbox'


let mapleader = " "

"FileTree
let g:NERDTreeChDirMode = 2
autocmd VimEnter * NERDTree | wincmd p
nnoremap <leader>fl <cmd>NERDTree<cr>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
"FileTree end

nnoremap <leader>ff <cmd>Telescope file_browser<cr>
nnoremap <leader>a <C-w>h
nnoremap <leader>d <C-w>l
nnoremap <leader>s <C-w>j
nnoremap <leader>w <C-w>k
noremap <leader>1 :w<CR>
noremap <leader>r <C-^>
nnoremap <C-c> :!g++ -o  %:r.out % -std=c++11<CR>
nnoremap <C-x> :!g++ -o  %:r.out % -std=c++11<CR> <bar>:FloatermNew %:r.out<CR>

let g:coc_snippet_next = '<c-l>'
let g:coc_snippet_prev = '<c-h>'
"Coc snippets remap to tab
" use <tab> for trigger completion and navigate to the next complete item
 function! s:check_back_space() abort
   let col = col('.') - 1
     return !col || getline('.')[col - 1]  =~ '\s'
     endfunction

     inoremap <silent><expr> <Tab>
           \ pumvisible() ? "\<C-n>" :
                 \ <SID>check_back_space() ? "\<Tab>" :
                       \ coc#refresh()Use <Tab> and <S-Tab> to navigate the completion list:

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"End of Coc remap
" telescope script

lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
EOF

let g:startify_custom_header =[
\ '  ██╗   ██╗██╗███╗   ███╗    ███╗   ███╗ █████╗  ██████╗██╗  ██╗    ██╗  ██╗ ',
\ '  ██║   ██║██║████╗ ████║    ████╗ ████║██╔══██╗██╔════╝██║  ██║    ╚██╗██╔╝ ',
\ '  ██║   ██║██║██╔████╔██║    ██╔████╔██║███████║██║     ███████║     ╚███╔╝  ',
\ '  ╚██╗ ██╔╝██║██║╚██╔╝██║    ██║╚██╔╝██║██╔══██║██║     ██╔══██║     ██╔██╗  ',
\ '   ╚████╔╝ ██║██║ ╚═╝ ██║    ██║ ╚═╝ ██║██║  ██║╚██████╗██║  ██║    ██╔╝ ██╗ ',
\ '    ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝',
\]

