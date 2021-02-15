" Table of Contents			*vimrc*
"	plugins
"		plugin_config
"	vim_settings
"		keymap
"	functions
"	external

"{{{ Plugins			*plugins*
call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'

" Git
Plug 'APZelos/blamer.nvim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
 
" File Management
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Syntax & Completion
Plug 'HerringtonDarkholme/yats.vim'
Plug 'elzr/vim-json'
Plug 'eslint/eslint'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'

" Theming
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'haishanh/night-owl.vim'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

call plug#end()

"{{{ Plugin Configuration			*plugin_config*
" Nerd Tree
nmap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <expr> <C-\> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" DadBod
" Run currently highlighted sql with :DB
vmap <Leader>db y<ESC>:DB <C-r>0<CR>

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
let g:NERDSpaceDelims = 1
let g:yats_host_keyword = 1

" Startify
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_bookmarks = [
  \ {'v': '~/.dotfiles/nvim/init.vim'},
  \ {'z': '~/.dotfiles/zsh/zshrc'},
  \ {'t': '~/.dotfiles/tmux.conf'}
  \ ]
let g:startify_session_dir = '.vim/sess'
let g:blamer_enabled = 1

" CoC
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-word',
  \ 'coc-tag',
  \ 'coc-emoji',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-json', 
  \ 'coc-angular',
  \ 'coc-vetur',
  \ 'coc-sql',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-clangd',
  \ 'coc-python'
  \ ]

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

"}}}
"}}}

"{{{ Settings			*vim_settings*
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set smarttab
set cindent
set expandtab
set pyxversion=3
set hidden 
set updatetime=300
set termguicolors
set cursorline
set listchars=tab:▸\ ,nbsp:_
set list
syntax enable
colorscheme night-owl

"{{{ Key Remaps			*keymap*
map <Leader>F :Ag<CR>
map <Leader>f :BLines<CR>
nmap <C-g> <C-b>
nmap <C-p> :Files<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> K :call <SID>show_documentation()<CR>
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

function! SaveSess()
  execute '![ -d .vim ] || mkdir .vim'
  execute '![ -d .vim/sess ] || mkdir .vim/sess'
  execute 'mks! ./.vim/sess/Last\ Session'
endfunction

function! Zen()
  set nu!
  set rnu!
  GitGutterDisable
endfunction

function! Unzen()
  set nu
  set rnu
  GitGutterEnable
endfunction
"}}}

"{{{ External Files			*external*
let $LOCALFILE=expand("~/.config/nvim/init_local.vim")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

let $REPOCONFIG=expand('./.vim/init.vim')
if filereadable($REPOCONFIG)
  source $REPOCONFIG
endif
"}}}

"/* vim: set foldmethod=marker: */
