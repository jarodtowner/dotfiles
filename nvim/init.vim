" ==========Table of Contents =============
" 
" Plugins ................. |plugins|
" Plugin Configuration .... |plugin_config|
" Vim Settings ............ |vim_settings|
" Theme ................... |theme|
" External Files .......... |external|
"
" =========================================

" |plugins|
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'eslint/eslint'
Plug 'mattn/emmet-vim'
Plug 'APZelos/blamer.nvim'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'preservim/tagbar'

"Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"Files
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Syntax Highlighting
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'elzr/vim-json'

"Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'haishanh/night-owl.vim'

call plug#end()
" |plugin_config|
nmap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <expr> <C-\> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <C-p> :Files<CR>
vmap ga <Plug>(EasyAlign)
nmap <C-l> :BLines<CR>
nmap <C-g> <C-b>
nmap bb :Buffers<CR>
nmap T :TagbarToggle<CR>
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
let g:NERDSpaceDelims = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_bookmarks = [
  \ {'v': '~/.dotfiles/nvim/init.vim'},
  \ {'z': '~/.dotfiles/zsh/zshrc'},
  \ {'t': '~/.dotfiles/tmux.conf'}
  \ ]
let g:startify_session_dir = '.vim'
let g:blamer_enabled = 1
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-json', 
  \ 'coc-angular',
  \ 'coc-vetur',
  \ 'coc-sql',
  \ 'coc-html',
  \ 'coc-css'
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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! SaveSess()
  execute '![ -d .vim ] || mkdir .vim'
  execute 'mks! ./.vim/Last\ Session'
endfunction

autocmd VimLeave * call SaveSess()

" |vim_settings|

set number relativenumber
set pyxversion=3
set tabstop=2
set shiftwidth=2
set smarttab
set cindent
set expandtab
set hidden 
set updatetime=300

" |theme|
if (has("termguicolors"))
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable
colorscheme dracula
let g:lightline = { 'colorscheme': 'dracula' }

" |external|
let $LOCALFILE=expand("~/.config/nvim/init_local.vim")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
