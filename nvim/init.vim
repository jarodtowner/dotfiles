call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'eslint/eslint'
Plug 'mattn/emmet-vim'
Plug 'APZelos/blamer.nvim'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'

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

Plug 'junegunn/vim-easy-align'
call plug#end()

" |file-nav|
nmap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <expr> <C-\> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <C-p> :Files<CR>
vmap ga <Plug>(EasyAlign)
nmap <C-l> :BLines<CR>
nmap <C-a> <C-b>
" |code-nav|
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Commenting
let g:NERDSpaceDelims = 1

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" |sessions|
function! SaveSess()
  execute '![ -d .vim ] || mkdir .vim'
  execute 'mks! ./.vim/Last\ Session'
endfunction

autocmd VimLeave * call SaveSess()

set number relativenumber
set pyxversion=3
set tabstop=2
set shiftwidth=2
set smarttab
set cindent
" always uses spaces instead of tab characters
set expandtab

" |theme|
if (has("termguicolors"))
  set termguicolors
endif
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
""""" enable the theme
syntax enable
colorscheme dracula
" To enable the lightline theme
let g:lightline = { 'colorscheme': 'dracula' }

" |startify|
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_bookmarks = [ {'v': '~/.dotfiles/nvim/init.vim'}, {'z': '~/.dotfiles/zsh/zshrc'}, {'t': '~/.dotfiles/tmux.conf'} ]
let g:startify_session_dir = '.vim'

" |git|
let g:blamer_enabled = 1

" |code-completion|
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-json', 
  \ 'coc-angular',
  \ 'coc-vetur',
  \ 'coc-sql',
  \ 'coc-html'
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

