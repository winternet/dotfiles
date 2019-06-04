call plug#begin()
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" ctags plugin
" Plug 'majutsushi/tagbar'
" replacement for tagbar
Plug 'liuchengxu/vista.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tomtom/tcomment_vim'
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" colorschemes
Plug 'tomasr/molokai'
Plug 'dikiaap/minimalist'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf', {'rtp':'/vim'}
" icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'lervag/vimtex'
" html
Plug 'mattn/emmet-vim'
Plug 'valloric/MatchTagAlways'
" git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" ruby
Plug 'vim-ruby/vim-ruby'
" delimiter
Plug 'Raimondi/delimitMate'
" autosave
Plug '907th/vim-auto-save'
" python
Plug 'davidhalter/jedi-vim'
call plug#end()

"source ~/.config/nvim/sessions.vim
source ~/.config/nvim/mappings.vim

filetype plugin indent on

set t_Co=256
set mouse=a

" true gui colors in terminal
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors
set spell

set noswapfile
set nopaste
filetype on
syntax on
set number
set undofile
set undodir="$HOME/.vimundo"
" Remember cursor position between vim sessions
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
set completeopt+=menuone,noinsert,noselect
set completeopt-=preview

" colorscheme
"colorscheme molokai
"colorscheme onedark
colorscheme onehalflight

" scroll line in the middle
let &scrolloff=999-&scrolloff

" line numbering
set relativenumber number

" spaces instead of tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" ignore whitespaces in :diffthis
set diffopt+=iwhite

" search ignorecase and smartcase
set ignorecase
set smartcase
" search as letters are entered
set incsearch
" do not scroll to TOP on last occurence
set nowrapscan

" set smart indentation gg=G
set smartindent

" highligh current cursor line
set cursorline

" disable folding per default
set nofoldenable

" nerdtree
let NERDTreeIgnore = ['\.pyc$', '\.js.map$']

"delimitMate
let delimitMate_expand_cr = 1

" filetypes
augroup filetypes
    autocmd!
    autocmd FileType html           setlocal foldmethod=syntax shiftwidth=2 tabstop=2
    autocmd FileType python         setlocal foldmethod=syntax expandtab shiftwidth=4 softtabstop=4
    autocmd FileType xml            setlocal foldmethod=syntax shiftwidth=2 tabstop=2
    autocmd Filetype java           setlocal foldmethod=syntax
    autocmd Filetype javascript     setlocal foldmethod=syntax 
    autocmd FileType cpp            setlocal foldmethod=syntax shiftwidth=2 tabstop=2
    autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
augroup end

" if hidden not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" always show signcolumns
set signcolumn=yes

"""""""""""""function! s:check_back_space() abort
"""""""""""""  let col = col('.') - 1
"""""""""""""  return !col || getline('.')[col - 1]  =~# '\s'
"""""""""""""endfunction
"""""""""""""
"""""""""""""" Use <c-space> for trigger completion.
"""""""""""""inoremap <silent><expr> <c-space> coc#refresh()
"""""""""""""
" Use `[c` and `]c` for navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <leader>c :Commands<CR>

"go
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go map <silent> gy <Plug>(go-def-type)
autocmd FileType go map <silent> <C-A-O> <Plug>(go-imports)
autocmd FileType go map <silent> gi <Plug>(coc-implementation)
autocmd FileType go map <silent> gw <Plug>(coc-references)


nnoremap <C-A-Left> <C-O>
nnoremap <C-A-Right> <C-I>

" coc plugin
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for coc.vim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> gl <Plug>(coc-codelens-action)
nmap <silent> <A-Enter> <Plug>(coc-codeaction)
nmap <silent> <C-p> <Plug>(coc-diagnostic-info)
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> <A-F6> <Plug>(coc-rename)
nmap <silent> <leader>f <Plug>(coc-format-selected)
"vnoremap <silent> <leader>f <Plug>(coc-format-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'cpp': [],
\}

" AutoSave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification

" Vista (tagbar)
let g:vista#renderer#enable_icon = 0
let g:vista_default_executive = 'coc'
let g:vista_icon_indent = ["▸ ", ""]
let g:vista_fzf_preview = ['right:50%']
let g:vista_sidebar_width = 40
