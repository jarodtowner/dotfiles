" *vimrc*
" == Table of Contents == 
" |plugins| Plugin list
" |plugin_config| Plugin configuration
" |functions| Custom functions
" |vim_settings| Vim Settings
" |theme| Theme customisation
" |external| Externally loaded files

" *plugins*
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'eslint/eslint'
Plug 'mattn/emmet-vim'
Plug 'APZelos/blamer.nvim'
Plug 'preservim/nerdcommenter'
" Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'preservim/tagbar'

"Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"SQL
Plug 'tpope/vim-dadbod'

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
Plug 'morhetz/gruvbox'
Plug 'haishanh/night-owl.vim'

call plug#end()

" *plugin_config*
" Nerd Tree
nmap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <expr> <C-\> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" DadBod
" Run currently highlighted sql with :DB
vmap <Leader>db y<ESC>:DB <C-r>0<CR>


" FZF
nmap <C-p> :Files<CR>
map <Leader>f :BLines<CR>
nmap <C-g> <C-b>
map <Leader>F :Ag<CR>
let g:fzf_layout = { 'down': '40%' }

" Code Formatting
vmap ga <Plug>(EasyAlign)
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
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
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

" *functions*
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! SaveSess()
  execute '![ -d .vim ] || mkdir .vim'
  execute '![ -d .vim/sess ] || mkdir .vim/sess'
  execute 'mks! ./.vim/sess/Last\ Session'
endfunction

autocmd VimLeave * call SaveSess()

" *vim_settings*

set number relativenumber
set pyxversion=3
set tabstop=2
set shiftwidth=2
set smarttab
set cindent
set expandtab
set hidden 
set updatetime=300
set mouse=a

" *theme*
set termguicolors
syntax enable
colorscheme night-owl
let g:lightline = { 'colorscheme': 'nightowl' }
" *external*
let $LOCALFILE=expand("~/.config/nvim/init_local.vim")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

let $REPOCONFIG=expand('./.vim/init.vim')
if filereadable($REPOCONFIG)
  source $REPOCONFIG
endif
