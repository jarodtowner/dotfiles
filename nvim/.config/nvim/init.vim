" Table of Contents			*vimrc*
"	plugins
"		plugin_config
"	vim_settings
"		keymap
"		filetype_settings
"	functions
"	external

"{{{ Plugins			*plugins*
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
 
" File Management
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'

" Syntax & Completion
Plug 'HerringtonDarkholme/yats.vim'
Plug 'elzr/vim-json'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'vim-scripts/SQLUtilities'
Plug 'stanangeloff/php.vim'
Plug 'kmyk/brainfuck-highlight.vim'
Plug 'jparise/vim-graphql'
Plug 'clones/vim-zsh'

" Linting
Plug 'stylelint/stylelint'
Plug 'eslint/eslint'

" Theming
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'haishanh/night-owl.vim'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

call plug#end()

"{{{ Plugin Configuration			*plugin_config*

" lightline
let g:lightline = {
    \   'colorscheme': 'nightowl',
    \   'active': {
    \     'left': [
    \               [ 'mode', 'paste' ],
    \               [ 'gitbranch', 'readonly', 'filename' ]
    \             ],
    \     'right': [
    \               [ 'percent' ],
    \               [ 'lineinfo' ],
    \               [ 'fileencoding', 'filetype' ]
    \              ]
    \   },
    \   'component_function': {
    \     'gitbranch': 'FugitiveHead',
    \     'filename': 'LightlineFilename'
    \   },
    \ }


" FZF
let g:fzf_layout = { 'down': '40%' }

" Code Formatting
let g:yats_host_keyword = 1


" CoC
let g:coc_global_extensions = [
  \ 'coc-angular',
  \ 'coc-clangd',
  \ 'coc-css',
  \ 'coc-eslint', 
  \ 'coc-html',
  \ 'coc-json', 
  \ 'coc-phpls',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-snippets',
  \ 'coc-sql',
  \ 'coc-stylelintplus',
  \ 'coc-tag',
  \ 'coc-tsserver',
  \ 'coc-vetur'
  \ ]

" fugitive
" set diffopt+=vertical "make diffs vertical

"}}}
"}}}

"{{{ Settings			*vim_settings*

colorscheme night-owl
set cindent
set cursorline 
set expandtab 
set hidden 
set list
set listchars=tab:▸\ ,nbsp:_ 
set nohlsearch
set number 
set pyxversion=3
set relativenumber 
set shiftwidth=2
set smarttab
set tabstop=2
set termguicolors
set updatetime=300
set foldlevel=99
filetype on
filetype plugin on
syntax enable

"{{{ Filetype Settings			*filetype_settings*
"
" sql
autocmd FileType sql setlocal commentstring=--\ %s

"}}}

"{{{ Key Remaps			*keymap*

nmap <silent> <C-p> :Files<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gbn :bnext<CR>
nmap <silent> gbp :bprev<CR>
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>act :CocAction<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"}}}
"}}}

"{{{ Functions			*functions*

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

"}}}

"{{{ External Files			*external*
let $LOCALFILE=expand("~/.config/local_override/nvim/init.vim")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

let $REPOCONFIG=expand('./.vim/init.vim')
if filereadable($REPOCONFIG)
  source $REPOCONFIG
endif
"}}}
